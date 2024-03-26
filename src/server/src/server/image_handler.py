import asyncio
from aiohttp import web

from coregistration.coregistrator import Coregistrator

coregistrator = Coregistrator()


class ImageHandler:
    def __init__(self):
        self.coregistrator = coregistrator

        self.user_img_filepath = ''
        self.map_img_filepath = ''
        self.out_img_filepath = ''

    async def handle_images(
            self,
            request: web.Request
    ) -> web.Response:
        """
        Handles the whole coregistration process.
        """
        download_result = await self.download_images(request)

        if not download_result.get('success'):
            return download_result.get('response')

        loop = asyncio.get_event_loop()

        await loop.run_in_executor(
            None,
            coregistrator.run,
            self.user_img_filepath,
            self.map_img_filepath,
            None,
            None,
            self.out_img_filepath
        )

        return web.Response(text='To be done')

    async def download_images(
            self,
            request: web.Request
    ) -> dict:
        """
        Saves the client images to the local storage.
        """
        reader = await request.multipart()

        while True:
            field = await reader.next()

            if not field:
                break

            if field.name in ('user_image', 'map_image'):
                filename = f'../../static/images/{field.filename}'

                if field.name == 'user_image':
                    self.user_img_filepath = filename
                if field.name == 'map_image':
                    self.map_img_filepath = filename

                with open(filename, 'wb') as f:
                    while True:
                        chunk = await field.read_chunk()
                        if not chunk:
                            break
                        f.write(chunk)

                    f.close()

            else:
                return dict(
                    success=False,
                    response=web.Response(text=f"Invalid field: {field.name}. Expected: 'user_image' or 'map_image'")
                )

        return dict(success=True)

        # with open(self.map_img_filepath, 'rb') as response_image:
        #    return web.Response(body=response_image.read(), content_type='image/jpeg')
