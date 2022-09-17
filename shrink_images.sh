#!/bin/bash
# Using imagemagick's convert to reduce the size of images by a percentage.    #
# $convert in.jpg -resize N% out.jpg                                           #
# Run from within the image dir and                                            #
# a) keep small version and delete in originals/                               #
# b) delete small version and move from ./originals/ back to .                 #
################################################################################

function resize_image() {
    local fname="$1"
    local percentage="$2"

    # make sure input is a file:
    if [[ -f "$fname" ]]; then
        # only consider new files
        if [[ ! "$fname" == *_small.??? ]] && [[ ! "$fname" == *_orig.??? ]]; then
            fending="${fname:(-3)}"
            out_small="${fname%.???}_small.$fending"
            out_orig="${fname%.???}_orig.$fending"

            echo -n "Resizing $fname ... "
            convert "$fname" -resize "$percentage"% "$out_small"
            if [[ $? == 0 ]]; then
                mv "$fname" originals/"$( basename "$out_orig" )"
                echo "Done"
            else
                echo "Failed!"
            fi
        fi
    fi
}

mkdir -p originals

for f in ./*.jpg; do
    resize_image "$f" 40
done
for f in ./*.png; do
    resize_image "$f" 40
done
