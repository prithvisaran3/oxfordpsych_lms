import 'package:deviraj_lms/app/ui/widgets/common/logo_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../controller/wishlist.dart';
import '../../widgets/common/appbar.dart';
import '../../widgets/common/cart_empty.dart';
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
                    ? const LogoLoading()
                    : WishListController.to.isWishlistEmpty == true
                        ? const CartEmpty(
                            emptyString: "Favourite Empty",
                            isShowButton: false,
                            image: 'favorite.png',
                          )
                        : GridView.builder(
                            padding: const EdgeInsets.all(15),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 10.0),
                            itemCount:
                                WishListController.to.wishListDetails.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    duration: const Duration(seconds: 2),
                                    child: FavouriteCard(
                                      data: WishListController
                                          .to.wishListDetails[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
              ));
        });
  }
}
