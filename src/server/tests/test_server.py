import unittest
import os

from aiohttp import web
from aiohttp.test_utils import AioHTTPTestCase
from aiohttp import FormData


class TestApp(AioHTTPTestCase):
    async def get_application(self):
        async def handle_image(request):
            reader = await request.multipart()
            field = await reader.next()

            if field.name in ('user_image', 'map_image'):
                filename = field.filename
                filepath = os.path.join('./', filename)

                with open(filepath, 'wb') as f:
                    while True:
                        chunk = await field.read_chunk()
                        if not chunk:
                            break
                        f.write(chunk)
                f.close()

                return web.Response(text=f'Success=True')

            else:
                return web.Response(text="Invalid field, expected 'image'")

        app = web.Application()
        app.router.add_post('/upload_image', handle_image)

        return app

    async def test_upload_image_with_coordinates(self):
        form = FormData()

        form.add_field('user_image', open('user_images/img_1.jpeg', 'rb'))
        form.add_field('map_image', open('user_images/img_2.jpeg', 'rb'))

        url = (
            f'/upload_image?'
            f'usr_1x=83.41027154663527&usr_1y=159.08441558441564'
            f'&usr_2x=831.4622195985835&usr_2y=149.11038961038957'
            f'&usr_3x=848.08559622196&usr_3y=1103.2922077922078'
            f'&usr_4x=85.07260920897295&usr_4y=1118.2532467532467'
            f'&map_1x=538.1351829988198&map_1y=205.62987012987014'
            f'&map_2x=917.1481700118065&map_2y=569.6818181818181'
            f'&map_3x=385.20011806375487&map_3y=1073.3701298701299'
            f'&map_4x=32.78453364817028&map_4y=642.8246753246754'
        )

        resp = await self.client.post(url, data=form)
        self.assertEqual(resp.status, 200)


if __name__ == '__main__':
    unittest.main()
