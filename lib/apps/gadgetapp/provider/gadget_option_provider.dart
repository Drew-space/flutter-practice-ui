import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_ui/apps/gadgetapp/models/gadget_option_models.dart';

final List<GadgetOption> allOptions = [
  GadgetOption(
    name: "iPhone",
    imageUrl: "https://i.ebayimg.com/images/g/668AAeSwTzto6q1i/s-l1600.webp",
  ),
  GadgetOption(
    name: "Laptop",
    imageUrl: "https://i.ebayimg.com/images/g/5VUAAeSwc-tppi6V/s-l1600.webp",
  ),
  GadgetOption(
    name: "Watch",
    imageUrl:
        "https://www.apple.com/v/apple-watch-series-11/c/images/overview/contrast/contrast_s11__dkui1dgfuwcy_large_2x.png",
  ),
  GadgetOption(
    name: "Airpod",
    imageUrl:
        "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-4-select-202409_FV1?wid=976&hei=916&fmt=jpeg&qlt=90&.v=WnVKRVRUTFVsYThXaWkydWViL1Q3ZDZGTE9TV3RDcGJJclBqdUtzdTJYYjNHc3NlSmU2dzJyR1kxZEwyTE1neUJkRlpCNVhYU3AwTldRQldlSnpRa0NZZXAxWFNjRXhITDI1RVE5YVpyU0E",
  ),
  GadgetOption(
    name: "Headset",
    imageUrl:
        "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-max-hero-select-202409?wid=976&hei=916&fmt=jpeg&qlt=90&.v=WXBZVEZCOUNiUWlBYUtjZmtBc0J2N1V1ZldxRmdZVjlvL2IxaEY3dzY3SG0ybW5TK3prTnlNTURRc1V2clYydHZvdUZlR0V0VUdJSjBWaDVNVG95YkJTUUExTVpiaXRIUnFOM1YxY0hPWFU",
  ),
];

final optionProvider = Provider((ref) {
  return allOptions;
});
