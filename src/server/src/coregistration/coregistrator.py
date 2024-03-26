import cv2
import numpy as np
import matplotlib.pyplot as plt

from typing import Any

class Coregistrator:
    def __init__(self):
        self.user_img_filepath = ''
        self.map_img_filepath = ''
        self.result_img_filepath = ''

    async def run(
            self,
            user_img_filepath: str,
            map_img_filepath: str,
            user_img_points: Any,
            map_img_points: Any,
            out_img_filepath: str
    ) -> dict:
        img_1_arr = plt.imread(user_img_filepath)
        img_2_arr = plt.imread(map_img_filepath)

        to_uint8 = lambda x: ((x - x.min()) / (x.max() - x.min()) * 255).astype(np.uint8)
        user_img_arr_uint8 = to_uint8(img_1_arr)
        map_img_arr_uint8 = to_uint8(img_2_arr)

        M, mask = cv2.findHomography(np.array(map_img_points), np.array(user_img_points), cv2.RANSAC, 5)

        img_2_arr_warped = cv2.warpPerspective(img_2_arr, M, (img_1_arr.shape[1], img_1_arr.shape[0]))

        cv2.imwrite(out_filename, img_2_arr_warped[..., ::-1])

        return dict()
