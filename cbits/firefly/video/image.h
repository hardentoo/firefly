#ifndef FIREFLY_VIDEO_IMAGE_H
#define FIREFLY_VIDEO_IMAGE_H

#include <GL/gl.h>

typedef struct {
    int width, height;
    int pixelSize;
    int tw, th; /* Powers of two */
    float ttc, rtc, btc, ltc; /* Texture coordinates */

    int *refcount;
    GLuint texture;
} ff_image;

ff_image *ff_imageCreate(int width, int height, int pixelSize, GLubyte *pixels);
ff_image *ff_imageFromGradient(int width, int height);
ff_image *ff_imageFromPng(const char *filePath);
void ff_imageFree(ff_image *image);

ff_image *ff_imageSlice(ff_image *image, int x, int y, int width, int height);

GLenum ff_formatForPixelSize(int pixelSize);
int ff_nearestPowerOfTwo(int x);
void ff_copyPixels(GLubyte *src, int sw, int sh,
        GLubyte *dst, int dw, int dh, int pixelSize);

#endif
