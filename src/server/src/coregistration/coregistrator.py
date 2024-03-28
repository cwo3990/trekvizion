import cv2
import numpy as np
import matplotlib.pyplot as plt
import time
import logging


class Coregistrator:
    def __init__(self):
        self.user_img_filepath = ''
        self.map_img_filepath = ''
        self.result_img_filepath = ''

    @staticmethod
    def to_unit8(x):
        """
        Convert input array x to uint8 datatype.
        :param x: input array to be converted.
        :return: converted array in uint8 datatype (numpy.ndarray).
        """
        return ((x - x.min()) / (x.max() - x.min()) * 255).astype(np.uint8)

    def run(
            self,
            user_img_filepath: str,
            map_img_filepath: str,
            user_img_points: list,
            map_img_points: list,
            result_img_filepath: str
    ) -> None:
        """
        Aligns the user image with the map image using homography transformation and saves the resulting image.
        :param user_img_filepath: the filepath of the user image.
        :param map_img_filepath: the filepath of the map image.
        :param user_img_points: list of points in the user image.
        :param map_img_points: list of corresponding points in the map image.
        :param result_img_filepath: the filepath to save the resulting image after coregistration.
        :return: None

        EXAMPLE
        1. Create an instance of Coregistrator
        coregistrator = Coregistrator()

        2. Define filepaths and points
        user_img_filepath = 'user_image.jpg'
        map_img_filepath = 'map_image.jpg'
        result_img_filepath = 'result_image.jpg'
        user_img_points = [(10, 20), (30, 40), (50, 60)]  # Example user image points
        map_img_points = [(15, 25), (35, 45), (55, 65)]  # Example map image points

        3. Run the coregistration process
        coregistrator.run(user_img_filepath, map_img_filepath, user_img_points, map_img_points, result_img_filepath)
        """

        self.user_img_filepath = user_img_filepath
        self.map_img_filepath = map_img_filepath
        self.result_img_filepath = result_img_filepath

        # reading the images
        user_img_arr = plt.imread(user_img_filepath)
        map_img_arr = plt.imread(map_img_filepath)

        # finding the homography using the points from the map and the user
        M, mask = cv2.findHomography(np.array(map_img_points), np.array(user_img_points), cv2.RANSAC, 5)

        # Performing warp perspective using CV2
        user_img_arr_warped = cv2.warpPerspective(user_img_arr, M,(map_img_arr.shape[1], map_img_arr.shape[0]))

        # Need to put the channels in the BGR order as CV2 reads it as RGB
        cv2.imwrite(self.result_img_filepath, user_img_arr_warped[..., ::-1])

        logging.warning(f'Coregistration done for the image: {self.result_img_filepath}')
