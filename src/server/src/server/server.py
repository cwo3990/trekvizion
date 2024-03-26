import aiohttp
from aiohttp import web
from image_handler import ImageHandler


image_handler = ImageHandler()


async def init_app() -> web.Application:
    """
    Initialize the server app
    :return: application instance
    """

    app = web.Application()
    app.router.add_post('/upload_image', image_handler.handle_images)
    return app


if __name__ == '__main__':
    app = init_app()
    web.run_app(app)
