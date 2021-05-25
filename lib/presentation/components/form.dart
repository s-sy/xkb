import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/auth/sing_in_form/sign_in_form_bloc.dart';
import 'package:flutter_ui/injection.dart';

class FormContainer extends StatefulWidget {
  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final TextEditingController _controller = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
        listener: (context, state) {},
        builder: (context, state) {
          // return BlocBuilder<SignInFormBloc, SignInFormState>(
          //     builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Form(
                    // autovalidate: state.showErrorMessages,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.5,
                                  color: Colors.white24,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              controller: _controller,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.smartphone),
                                icon: Icon(
                                  Icons.smartphone,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                                hintText: "输入手机号",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 15.0),
                                contentPadding: EdgeInsets.only(
                                    top: 30.0,
                                    right: 30.0,
                                    bottom: 30.0,
                                    left: 5.0),
                              ),
                              obscureText: false,
                              autocorrect: false,
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                // if (!state.isReset) {
                                //   BlocProvider.of<SignInFormBloc>(context)
                                //     ..add(SignInFormEvent.phoneChanged(value));
                                // } else {
                                //   BlocProvider.of<SignInFormBloc>(context)
                                //     ..add(SignInFormEvent.changePhone(value));
                                // }
                                BlocProvider.of<SignInFormBloc>(context)
                                  ..add(SignInFormEvent.phoneChanged(value));
                              },
                              // validator: (value) {
                              //   RegExp reg = new RegExp(r'^\d{11}$');
                              //   if (!reg.hasMatch(value)) {
                              //     return '请输入11位手机号码';
                              //   }
                              //   return null;
                              // },
                              validator: (_) =>
                                  BlocProvider.of<SignInFormBloc>(context)
                                      .state
                                      .phoneNumber
                                      .value
                                      .fold(
                                        (f) => f.maybeMap(
                                          invalidPhone: (_) => '无效号码',
                                          orElse: () => null,
                                        ),
                                        (_) => null,
                                      ),
                            ),
                          )
                        ])),
              ],
            ),
          );
        });
  }
}

// class FormContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => getIt<SignInFormBloc>(),
//         child: BlocConsumer<SignInFormBloc, SignInFormState>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               // return BlocBuilder<SignInFormBloc, SignInFormState>(
//               //     builder: (context, state) {
//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Form(
//                         // autovalidate: state.showErrorMessages,
//                         autovalidateMode: AutovalidateMode.onUserInteraction,
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: <Widget>[
//                               Container(
//                                 decoration: BoxDecoration(
//                                   border: Border(
//                                     bottom: BorderSide(
//                                       width: 0.5,
//                                       color: Colors.white24,
//                                     ),
//                                   ),
//                                 ),
//                                 child: TextFormField(
//                                   controller: TextEditingController.fromValue(
//                                       TextEditingValue(
//                                           /* 默认值逻辑*/
//                                           text: textFild,
//                                               /* 设置光标停留位置，保持始终停留在末尾*/
//                                               selection:
//                                                   TextSelection.fromPosition(
//                                                       TextPosition(
//                                                           affinity:
//                                                               TextAffinity
//                                                                   .downstream,
//                                                           offset: inputText
//                                                               .length))))),
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 20.0),
//                                   decoration: InputDecoration(
//                                     // prefixIcon: Icon(Icons.smartphone),
//                                     icon: Icon(
//                                       Icons.smartphone,
//                                       color: Colors.white,
//                                     ),
//                                     border: InputBorder.none,
//                                     hintText: "输入手机号",
//                                     hintStyle: TextStyle(
//                                         color: Colors.white, fontSize: 15.0),
//                                     contentPadding: EdgeInsets.only(
//                                         top: 30.0,
//                                         right: 30.0,
//                                         bottom: 30.0,
//                                         left: 5.0),
//                                   ),
//                                   // obscureText: false,
//                                   autocorrect: false,
//                                   keyboardType: TextInputType.phone,
//                                   onChanged: (value) {
//                                     if (!state.isReset) {
//                                       BlocProvider.of<SignInFormBloc>(context)
//                                         ..add(SignInFormEvent.phoneChanged(
//                                             value));
//                                     } else {
//                                       BlocProvider.of<SignInFormBloc>(context)
//                                         ..add(
//                                             SignInFormEvent.changePhone(value));
//                                     }
//                                   },
//                                   validator: (_) =>
//                                       BlocProvider.of<SignInFormBloc>(context)
//                                           .state
//                                           .phoneNumber
//                                           .value
//                                           .fold(
//                                             (f) => f.maybeMap(
//                                               invalidPhone: (_) => '无效号码',
//                                               orElse: () => null,
//                                             ),
//                                             (_) => null,
//                                           ),
//                                 ),
//                               )
//                             ])),
//                   ],
//                 ),
//               );
//             }));
//   }
// }
