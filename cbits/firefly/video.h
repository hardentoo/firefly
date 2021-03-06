#ifndef FIREFLY_VIDEO_H
#define FIREFLY_VIDEO_H

#include "firefly/video/font.h"
#include "firefly/video/texture.h"

void ff_setVideoMode(int width, int height, int fullScreen);
void ff_setScreenSize(int width, int height);
int ff_getScreenWidth(void);
int ff_getScreenHeight(void);
int ff_isFullScreen(void);
int ff_getFullScreenModes(int maxModes, int *modes);

void ff_setShowCursor(int showCursor);
int ff_isShowCursor(void);

void ff_setSmoothLines(int smoothLines);

void ff_startFrame(void);
void ff_endFrame(void);

void ff_startLine(void);
void ff_endLine(void);

void ff_startTriangles(void);
void ff_endTriangles(void);

void ff_startQuads(void);
void ff_endQuads(void);

void ff_vertex(double x, double y);

void ff_drawLines(double *xys, int num);

void ff_drawCircle(double x, double y, double r, int steps);

void ff_drawTexture(double x, double y, ff_texture *texture);
void ff_drawTextureCentered(double x, double y, ff_texture *texture);
void ff_drawTextureDebug(double x, double y, ff_texture *texture);
void ff_drawTextures(double *xys, ff_texture **textures, int num);

void ff_drawString(double x, double y, ff_font *font,
        const unsigned long *string, int stringLength);
void ff_drawStringCentered(double x, double y, ff_font *font,
        const unsigned long *string, int stringLength);

void ff_pushMatrix(void);
void ff_popMatrix(void);
void ff_translate(double x, double y);
void ff_rotate(double r);
void ff_scale(double x, double y);

void ff_setColor(double r, double g, double b, double a);
void ff_getColor(double *rgba);
void ff_setBackgroundColor(double r, double g, double b, double a);

void ff_setLineWidth(double lw);

#endif
