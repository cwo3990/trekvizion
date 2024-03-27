import cv2
import numpy as np
import matplotlib.pyplot as plt
import asyncio

from typing import Any


class Coregistrator:
    def __init__(self):
        self.user_img_filepath = ''
        self.map_img_filepath = ''
        self.result_img_filepath = ''

    def run(
            self,
            user_img_filepath: str,
            map_img_filepath: str,
            user_img_points: Any,
            map_img_points: Any,
            out_img_filepath: str
    ) -> None:
        """

        :param user_img_filepath:
        :param map_img_filepath:
        :param user_img_points:
        :param map_img_points:
        :param out_img_filepath:
        :return:
        """

        # below is the code just to test synchronous opencv code in async context
        # since we do not have the adapted opencv coregistration yet
        img = cv2.imread(user_img_filepath)
        grayscale_img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
        cv2.imwrite(out_img_filepath, grayscale_img)
