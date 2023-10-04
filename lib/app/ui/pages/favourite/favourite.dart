import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/wishlist.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/common/cart_empty.dart';
import '../../widgets/common/loading.dart';
import '../../widgets/favourite.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: WishListController(),
        initState: (_) {
          WishListController.to.getWishList();
        },
        builder: (_) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: commonAppBar(
                centerTitle: true,
                title: "Favourite",
              ),
              body: Obx(
                () => WishListController.to.getLoading == true
                    ? const SimpleLoading()
                    : WishListController.to.isWishlistEmpty == true
                        ? const CartEmpty(
                            emptyString: "Favourtie Empty",
                            isShowButton: false,
                            image: 'favorite.png',
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.all(15),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.65,
                                    crossAxisSpacing: 8.0),
                            itemCount:
                                WishListController.to.wishListDetails.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FavouriteCard(
                                data: WishListController
                                    .to.wishListDetails[index],
                              );
                            },
                          ),
              ));
        });
  }
}
