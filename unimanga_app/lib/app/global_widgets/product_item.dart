// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intern_vua_gao/app/constants/app_colors.dart';
// import 'package:intern_vua_gao/app/constants/app_fonts.dart';
// import 'package:intern_vua_gao/app/models/product_model.dart';
// import 'package:intern_vua_gao/app/modules/product_detail/bindings/product_detail_bindings.dart';
// import 'package:intern_vua_gao/app/modules/product_detail/controllers/product_detail_controllers.dart';
// import 'package:intern_vua_gao/app/modules/product_detail/models/product_detail_models.dart';
// import 'package:intern_vua_gao/app/routes/app_pages.dart';


// class ProductItem extends GetView<ProductDetailController>{
//   final ProductModel product;
//   ProductItem({required this.product});
//   Widget build(BuildContext context){
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double itemWidth = screenWidth * 0.4;
//     final double imageHeight = itemWidth * 0.75;

//     return GestureDetector(
//       onTap: (){
//         ProducDetailBinding().dependencies();
//         controller.saveProductId(product.id);
//         Get.toNamed(Routes.PRODUCTS_DETAIL);
        
//       },
//       child: Container(
//         height: screenHeight * 0.29,
//         padding: EdgeInsets.only(
//           right: screenWidth * 0.02, 
//           left:screenWidth * 0.02,
//           top: screenWidth * 0.02, 
//           ),
//         //margin: EdgeInsets.only(right: screenWidth * 0.02),
//         width: itemWidth,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(screenWidth * 0.01),
//           border: Border.all(color: AppColors.grayLight,width: screenWidth * 0.0001),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5), 
//               spreadRadius: 1, 
//               blurRadius: 2, 
//               offset: Offset(1, 2),
//             ),
//           ]
//         ),
//         child: Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Image.network(
//                   'https://api.vuagaovn.com/${product.image}',
//                   height: imageHeight,
//                   width: itemWidth,
//                 ),
//               ),
//             ),
//             Container(
//               height: screenHeight * 0.05,
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 product.name!,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.03,
//                   fontFamily: AppFonts.verLag,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 product.price!,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.027,
//                   fontFamily: AppFonts.verLag,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "Đã bán ${product.sold}",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.025,
//                   fontFamily: AppFonts.verLag,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProductInvoiceItem extends GetView<ProductDetailController>{
//   final ProductInvoiceModel product;
//   ScrollController? scrollController;
//   ProductInvoiceItem({required this.product , this.scrollController});
//   Widget build(BuildContext context){
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double itemWidth = screenWidth * 0.4;
//     final double imageHeight = itemWidth * 0.75;
//     return GestureDetector(
//       onTap: (){
//         scrollController?.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);    
//         ProducDetailBinding().dependencies();
//         Get.toNamed(Routes.PRODUCTS_DETAIL);
//         controller.saveProductId(product.id);
//       },
//       child: Container(
//         height: screenHeight * 0.29,
//         padding: EdgeInsets.only(
//           right: screenWidth * 0.02, 
//           left:screenWidth * 0.02,
//           top: screenWidth * 0.02, 
//           ),
//         //margin: EdgeInsets.only(right: screenWidth * 0.02),
//         width: itemWidth,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(screenWidth * 0.01),
//           border: Border.all(color: AppColors.grayLight,width: screenWidth * 0.0001),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5), 
//               spreadRadius: 1, 
//               blurRadius: 2, 
//               offset: Offset(1, 2),
//             ),
//           ]
//         ),
//         child: Column(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Image.network(
//                   'https://api.vuagaovn.com/${product.image}',
//                   height: imageHeight,
//                   width: itemWidth,
//                 ),
//               ),
//             ),
//             Container(
//               height: screenHeight * 0.05,
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 product.name!,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.03,
//                   fontFamily: AppFonts.verLag,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 product.price!,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.027,
//                   fontFamily: AppFonts.verLag,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 "Đã bán ${product.sold}",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.025,
//                   fontFamily: AppFonts.verLag,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }