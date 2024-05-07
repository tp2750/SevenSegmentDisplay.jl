function filter_it(mask, target, topleft, bottomright; invert_target = true, visual_debug = false) ## , topright, bottomleft; invert_mask=false, invert_target = false)
  res1 = 0.0
  res2 = 0.0
  target_float = Float64.(Images.Gray.(target))
  if invert_target 
    target_float = 1 .- target_float
  end
  target_inv = 1 .- target_float
  delta_y, delta_x = bottomright .- topleft
  ## TODO skew_y
  mask_scale_x = delta_x / size(mask,2)
  mask_scale_y = delta_y / size(mask,1)
##   @show delta_x , delta_y, mask_scale_x, mask_scale_y
  if visual_debug 
     ImageDraw.draw!(target, ImageDraw.RectanglePoints(ImageDraw.Point(reverse(topleft)), ImageDraw.Point(reverse(bottomright))), Images.RGB(0,1,0))
  end
  #imshow(target)
  for j = 0:delta_x-1
    for i = 0:delta_y-1
       res1 += target_float[i + topleft[1], j + topleft[2]] * mask[Int(floor(i/mask_scale_y)+1), Int(floor(j/mask_scale_x)+1)]
       res2 += target_inv[i + topleft[1], j + topleft[2]] * mask[Int(floor(i/mask_scale_y)+1), Int(floor(j/mask_scale_x)+1)]
    end
  end
  (res1, res2)
end

function digit_score(target,topleft, bottomright, dig_masks = SSD.dig2seg; visual_debug = false)
  if visual_debug 
     ImageDraw.draw!(target, ImageDraw.RectanglePoints(ImageDraw.Point(reverse(topleft)), ImageDraw.Point(reverse(bottomright))), Images.RGB(0,1,0))
  end
  vals = values(dig_masks)
  ks = keys(dig_masks)
  scores = [filter_it(x, target, topleft, bottomright) for x in vals]
  scores
end

