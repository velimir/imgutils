#include "erl_nif.h"

#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include "stb_image_resize.h"

static ERL_NIF_TERM resize(ErlNifEnv *env, int argc,
                           const ERL_NIF_TERM argv[]) {
  ErlNifBinary in_img_binary;
  enif_inspect_binary(env, argv[0], &in_img_binary);

  unsigned in_width, in_height, num_channels;
  enif_get_uint(env, argv[1], &in_width);
  enif_get_uint(env, argv[2], &in_height);
  enif_get_uint(env, argv[3], &num_channels);

  unsigned out_width, out_height;
  enif_get_uint(env, argv[4], &out_width);
  enif_get_uint(env, argv[5], &out_height);

  unsigned long output_size;
  output_size = out_width * out_height * num_channels;
  ErlNifBinary out_img_binary;
  enif_alloc_binary(output_size, &out_img_binary);

  if (stbir_resize_uint8(
        in_img_binary.data, in_width, in_height, 0,
        out_img_binary.data, out_width, out_height, 0, num_channels) != 1)
    return enif_make_tuple2(
      env,
      enif_make_atom(env, "error"),
      enif_make_atom(env, "resize"));

  ERL_NIF_TERM out_img_term;
  out_img_term = enif_make_binary(env, &out_img_binary);

  return enif_make_tuple2(env, enif_make_atom(env, "ok"), out_img_term);
}


static ErlNifFunc nif_funcs[] = {
  {"resize", 6, resize}
};

ERL_NIF_INIT(Elixir.ImgUtils, nif_funcs, NULL, NULL, NULL, NULL)

/* Local Variables: */
/* c-basic-offset: 2 */
/* End: */
