/* move_step_basic(longitudinal_speed, rotational_speed, parent_solid)
 *
 * This script handles both forward/backward motion and rotational motion.
 * It should be called once per step for each object using the motion engine.
 *
 * longitudinal_speed: the speed of forward motion (in pixels per step).
 *                     Positive for forward motion, negative for backward.
 *
 * rotational_speed: the speed of rotation (in degrees per step).
 *                   Positive values correspond to CCW motion, negative CW.
 *
 * parent_solid: the parent object from which all surfaces descend.
 */

return move_step_ext(x + lengthdir_x(argument0, image_angle),
              y + lengthdir_y(argument0, image_angle),
              argument1,
              argument2);
