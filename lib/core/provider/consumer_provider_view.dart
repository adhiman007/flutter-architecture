import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider_model.dart';

class ConsumerProviderView<P extends ProviderModel> extends StatefulWidget {
  final Widget Function(BuildContext context, P provider, Widget child) builder;
  final P provider;
  final Widget child;
  final void Function(P) onProviderReady;
  const ConsumerProviderView(
      {Key key,
      @required this.provider,
      this.child,
      @required this.builder,
      this.onProviderReady})
      : super(key: key);

  @override
  _ConsumerProviderViewState<P> createState() =>
      _ConsumerProviderViewState<P>();
}

class _ConsumerProviderViewState<P extends ProviderModel>
    extends State<ConsumerProviderView<P>> {
  @override
  void initState() {
    super.initState();
    if (widget.onProviderReady != null) widget.onProviderReady(widget.provider);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<P>(
      create: (context) => widget.provider,
      child: Consumer<P>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
