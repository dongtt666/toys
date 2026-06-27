#encoding=utf-8

import Image, ImageDraw, sys, pprint

if __name__ == '__main__':
    im = Image.new('L', (400,400), 255)
    draw = ImageDraw.Draw(im)
    draw.line((0,0,400,400),fill=0)
    draw.line((0,400,400,0),fill=0)
    draw.ellipse((0,0,25,25), outline=0)
    draw.ellipse((375,375,400,400), outline = 0)
    draw.ellipse((200,200,300,300), outline = 0)
    draw.ellipse((0,350,25,400), outline = 128)
    textStr = 'hello !'
    textSize = draw.textsize(textStr)
    draw.text((200-textSize[0]/2.0,200-textSize[1]/2.0),textStr,fill=128)
    im.save('./PIL.jpg')
