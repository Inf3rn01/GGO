import 'package:ggo/features/personalization/models/user_model.dart';
import 'package:ggo/routes/routes.dart';
import 'package:ggo/utils/constants/enums.dart';
import 'package:ggo/utils/constants/images_strings.dart';

import '../features/shop/models/banner_model.dart';
import '../features/shop/models/category_models.dart';

class GDummyData {
  
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: GImages.promoBanner1, targetScreen: GRoutes.search, active: true),
    BannerModel(imageUrl: GImages.productImageAssault1, targetScreen: GRoutes.order, active: true),
  ];

  // /// User
  // static final UserModel user = UserModel(
  //   id: '1',
  //   name: 'Dan',
  //   phoneNumber: '+79682834638',
  //   email: 'danilpugachev253@gmail.com',
  //   profilePicture: GImages.user,
  //   addresses: [
  //     AddressModel(
  //       id: '1',
  //       name: 'Dan',
  //       phoneNumber: '+79682834638',
  //       country: 'Россия',
  //       city: 'Волгоград',
  //       Steet: 'Веселая балка',
  //       house: '29',
  //       apartment: '20'
  //     )
  //   ]
  // );

  // /// Cart
  // static final CartModel cart = CartModel(
  //   cartID: '1',
  //   items: [
  //     CartItemModel(
  //       productID: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       price: products[0].price,
  //     ),
  //     CartItemModel(
  //       productID: '2',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       price: products[0].price,
  //     ),
  //   ]
  // );

  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: '1',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmmount: 2000,
  //     orderDate: DateTime(2024, 05, 24),
  //     deliveryDate: DateTime(2024, 05, 25),
  //   ),
  //   OrderModel(
  //     id: '2',
  //     status: OrderStatus.shipped,
  //     items: cart.items,
  //     totalAmmount: 1000,
  //     orderDate: DateTime(2024, 06, 14),
  //     deliveryDate: DateTime(2024, 06, 15),
  //   ),
  // ];

  /// Список всех категорий
  // static final List<CategoryModel> categories = [
  //   CategoryModel(id: '1', name: 'Assaults', image: GImages.assault, isFeatured: true),
  //   CategoryModel(id: '2', name: 'Snipers', image: GImages.sniper, isFeatured: true),
  //   CategoryModel(id: '3', name: 'Shotguns', image: GImages.shotgun, isFeatured: true),
  //   CategoryModel(id: '4', name: 'Pistols', image: GImages.pistol, isFeatured: true),
  //   CategoryModel(id: '5', name: 'Others', image: GImages.other, isFeatured: true),
  // ];

  /// Список всех продуктов и их категорий
  // static final List<ProductCategoryModel> productCategories = [
  //   ProductCategoryModel(productId: '1', categoryId: '1'),
  //   ProductCategoryModel(productId: '2', categoryId: '1'),
  //   ProductCategoryModel(productId: '3', categoryId: '1'),
  //   ProductCategoryModel(productId: '4', categoryId: '1'),

  //   ProductCategoryModel(productId: '5', categoryId: '2'),
  //   ProductCategoryModel(productId: '6', categoryId: '2'),
  //   ProductCategoryModel(productId: '7', categoryId: '2'),
  //   ProductCategoryModel(productId: '8', categoryId: '2'),

  //   ProductCategoryModel(productId: '9', categoryId: '3'),
  //   ProductCategoryModel(productId: '10', categoryId: '3'),
  //   ProductCategoryModel(productId: '11', categoryId: '3'),
  //   ProductCategoryModel(productId: '12', categoryId: '3'),

  //   ProductCategoryModel(productId: '13', categoryId: '4'),
  //   ProductCategoryModel(productId: '14', categoryId: '4'),
  //   ProductCategoryModel(productId: '15', categoryId: '4'),
  //   ProductCategoryModel(productId: '16', categoryId: '4'),

  //   ProductCategoryModel(productId: '17', categoryId: '5'),
  //   ProductCategoryModel(productId: '18', categoryId: '5'),
  //   ProductCategoryModel(productId: '19', categoryId: '5'),
  //   ProductCategoryModel(productId: '20', categoryId: '5'),
  // ];

  /// Список всех продуктов
  // static final List<ProductModel> products = [
  //   ProductModel(
  //     id: '1',
  //     categoryId: '1',
  //     images: [GImages.productImageAssault1, GImages.productImageAssault2],
  //     title: 'AK-47',
  //     price: 1000,
  //     isFeatured: true,
  //     thumbnail: GImages.productImageAssault1,
  //     description: 'Автомат АК-47, официально известный как Автомат Калашникова, представляет собой газовую штурмовую винтовку под патрон 7,62×39 мм. Популярность этой модели и ее модификаций во всем мире объясняется их надежностью в суровых условиях эксплуатации, низкой стоимостью производства, доступностью практически в любом географическом регионе и простотой использования.',
  //     features: [
  //       ProductFeaturesModel(title: 'Country of manufacture', value: 'Russia'),
  //       ProductFeaturesModel(title: 'Weight', value: '5 kg'),
  //       ProductFeaturesModel(title: 'Length of manufacture', value: '870 mm'),
  //       ProductFeaturesModel(title: 'Cartridge', value: '7,62x39 mm'),
  //       ProductFeaturesModel(title: 'Departure speed', value: '715 m/s'),
  //       ProductFeaturesModel(title: 'Firing range', value: '800 m'),
  //     ],
  //   ),

  // ];



}
