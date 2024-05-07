import SevenSegmentDisplay as SSD
using ImageView
SSD.dig2seg
d8 = SSD.dig2seg[8]
imshow(d8)

using ImageIO
using FileIO
ref1 = load("examples/display_reference.png");

## 
filter_it(d8, ref1, (56,44), (166,99))
filter_it(d8, ref1, (61,53), (163,94), visual_debug=true)

digit_score(ref1,(56,44), (166,99), SSD.dig2seg)
ref2 = copy(ref1)
digit_score(ref2,(60,52), (161,95), SSD.dig2seg, visual_debug = true)

imshow(ref2)
