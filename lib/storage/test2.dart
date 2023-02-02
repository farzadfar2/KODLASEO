import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class CreateProductListItemDetail extends StatefulWidget {
  CreateProductListItemDetail({Key key}) : super(key: key);

  @override
  _CreateProductListItemDetailState createState() =>
      _CreateProductListItemDetailState();
}

class _CreateProductListItemDetailState
    extends State<CreateProductListItemDetail> with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();

  void _itemDroppedOnCustomerCart({
    Item item,
    Customer customer,
  }) {
    setState(() {
      customer.items.add(item);
    });
  }

  List<Item> _items = [
    Item(
      name: 'Spinach Pizza',
      totalPriceCents: 1299,
      uid: '1',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg'),
    ),
    Item(
      name: 'Veggie Delight',
      totalPriceCents: 799,
      uid: '2',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Food2.jpg'),
    ),
    Item(
      name: 'Chicken Parmesan',
      totalPriceCents: 1499,
      uid: '3',
      imageProvider: NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Food3.jpg'),
    ),
  ];

  List<Customer> _people = [
    Customer(
      name: 'Makayla',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg'),
    ),
    Customer(
      name: 'Nathan',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar2.jpg'),
    ),
    Customer(
      name: 'Emilio',
      imageProvider: const NetworkImage('https://flutter'
          '.dev/docs/cookbook/img-files/effects/split-check/Avatar3.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisCount:1 ,
        children: [
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            itemCount: _items.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12.0,
              );
            },
            itemBuilder: (context, index) {
              final item = _items[index];
              return ResponsiveWrapper(
                child: LongPressDraggable<Item>(
                  data: item,
                  dragAnchorStrategy: pointerDragAnchorStrategy,
                  feedback: DraggingListItem(
                    dragKey: _draggableKey,
                    photoProvider: item.imageProvider,
                  ),
                  child: MenuListItem(
                    name: item.name,
                    price: item.formattedTotalItemPrice,
                    photoProvider: item.imageProvider,
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 20.0,
            ),
            child: Row(
              children: _people.map(_buildPersonWithDropZone).toList(),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPersonWithDropZone(Customer customer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
        ),
        child: DragTarget<Item>(
          builder: (context, candidateItems, rejectedItems) {
            return CustomerCart(
              hasItems: customer.items.isNotEmpty,
              highlighted: candidateItems.isNotEmpty,
              customer: customer,
            );
          },
          onAccept: (item) {
            _itemDroppedOnCustomerCart(
              item: item,
              customer: customer,
            );
          },
        ),
      ),
    );
  }
}

class CustomerCart extends StatelessWidget {
  CustomerCart({
    Key key,
    this.customer,
    this.highlighted = false,
    this.hasItems = false,
  }) : super(key: key);

  final Customer customer;
  final bool highlighted;
  final bool hasItems;

  @override
  Widget build(BuildContext context) {
    final textColor = highlighted ? Colors.white : Colors.black;

    return Transform.scale(
      scale: highlighted ? 1.075 : 1.0,
      child: Material(
        elevation: highlighted ? 8.0 : 4.0,
        borderRadius: BorderRadius.circular(22.0),
        color: highlighted ? const Color(0xFFF64209) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Image(
                    image: customer.imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                customer.name,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: textColor,
                  fontWeight:
                  hasItems ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              Visibility(
                visible: hasItems,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Column(
                  children: [
                    const SizedBox(height: 4.0),
                    Text(
                      customer.formattedTotalItemPrice,
                      style: Theme.of(context).textTheme.caption.copyWith(
                        color: textColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${customer.items.length} item${customer.items.length != 1 ? 's' : ''}',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: textColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  MenuListItem(
      {Key key,
        this.name = '',
        this.price = '',
        this.photoProvider,
        this.isDepressed})
      : super(key: key);

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 130 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image(
                      image: photoProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  DraggingListItem({
    Key key,
    this.dragKey,
    this.photoProvider,
  }) : super(key: key);

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    this.totalPriceCents,
    this.name,
    this.uid,
    this.imageProvider,
  });

  final int totalPriceCents;
  final String name;
  final String uid;
  final ImageProvider imageProvider;

  String get formattedTotalItemPrice =>
      '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class Customer {
  Customer({
    this.name,
    this.imageProvider,
    List<Item> items,
  }) : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents =
    items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
