// 03: Flexible Compound Components with context

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/2/context.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/03/extra/2/toggle_consumer.dart';
import 'package:ap_over_react/switch.dart';

// ignore: uri_has_not_been_generated
part 'toggle.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = _$Toggle;

@Props()
class _$ToggleProps extends AbstractToggleProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

@State()
class _$ToggleState extends UiState {
  // Whether the toggle is On or Off
  bool isOn;
}

@Component2()
class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()..isOn = false);

  void toggle(_) {
    setState((newState()..isOn = !state.isOn), () => props.onToggle(state.isOn));
  }

  static On(children) {
    return ToggleConsumer()(
      (value) {
        if (value.isOn) {
          return Dom.span()(children);
        } else {
          return null;
        }
      },
    );
  }

  static Off(children) {
    return ToggleConsumer()(
      (value) {
        if (value.isOn) {
          return null;
        } else {
          return Dom.span()(children);
        }
      },
    );
  }

  static Button() {
    return ToggleConsumer()(
      (value) {
        return (Switch()
          ..isOn = value.isOn
          ..onClick = value.toggle
        )();
      },
    );
  }

  @override
  render() {
    var tValue = BaseToggleProps()
      ..isOn = state.isOn
      ..toggle = toggle;
    return (ToggleContext.Provider()..value = tValue)(
      props.children,
    );
  }
}
