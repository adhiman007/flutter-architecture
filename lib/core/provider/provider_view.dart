import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider_model.dart';

class ProviderView<P extends ProviderModel> extends StatefulWidget {
  final Widget Function(BuildContext context, P provider, Widget child) builder;
  final Widget child;
  final void Function(P) onProviderReady;

  ProviderView({
    Key key,
    @required this.builder,
    this.child,
    this.onProviderReady,
  }) : super(key: key);

  _ProviderViewState<P> createState() => _ProviderViewState<P>();
}

class _ProviderViewState<P extends ProviderModel>
    extends State<ProviderView<P>> {
  P provider;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.onProviderReady != null)
  //     Future.delayed(Duration.zero, () {
  //       widget.onProviderReady(Provider.of<P>(context));
  //     });
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<P>(context);
    if (this.provider != provider) {
      this.provider = provider;
      if (widget.onProviderReady != null) widget.onProviderReady(provider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<P>(
      builder: widget.builder,
      child: widget.child,
    );
  }
}
