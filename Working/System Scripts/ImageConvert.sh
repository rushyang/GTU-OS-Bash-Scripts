: << --
cd /home/user/images
mkdir resized_images
cp /home/user/images/* /home/user/images/resized_images

Now that you have a copy of the files in resized_images, time to resize them all:

mogrify -resize 800 *.jpg

This will resize them all to a width of 800px while keeping the aspect ratio. If you want a fixed image size, you can specify it like this:

mogrify -resize 800×600! *.jpg 

--

