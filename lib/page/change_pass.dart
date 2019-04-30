import 'package:flower_shop/widgets/back_nav.dart';
import 'package:flutter/material.dart';
import '../router.dart';
import 'base.dart';

var ChangePass = () {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  var valueMap = {
    "old_pass": "",
    "pass": "",
    "comfirm_pass": ""
  };

  void forSubmitted() {
    var form = formKey.currentState;

    if (form.validate()) {
      form.save();
      print(valueMap);
    }
  }

  String validator(String val) {
    return val.length < 6 ? "密码长度错误" : null;
  }

  String validatorComfirm(val){
    return valueMap["pass"] == val ? null : "确认密码不一致";
  }

  var _ctl = TextEditingController();

  _ctl.addListener((){
    valueMap["pass"] = _ctl.value.text;
  });

  var Page = BodyPage.formBuild((BuildContext ctx, Map params, NoRoute router) {

    var Field = (String label, FormFieldValidator<String> validator, String fieldName, [TextEditingController ctl]) => Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.deepOrange,
        controller: ctl != null ? ctl : null,
        decoration: InputDecoration(
            hasFloatingPlaceholder: false,
            labelText: label, border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange))
        ),
        obscureText: true,
        validator: validator,
        onSaved: (val) {
          valueMap[fieldName] = val;
        },
      ),
    );

    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            IOSNavBar(ctx),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text("修改密码", textScaleFactor: 1.6),
            ),
            Field("旧密码", validator, "old_pass"),
            Field("新密码", validator, "pass", _ctl),
            Field("确认密码", validatorComfirm, "comfirm_pass"),
            FlatButton(
              color: Colors.deepOrange,
              child: Text("提交", style: TextStyle(color: Colors.white)),
              onPressed: () => forSubmitted(),
            )
          ],
        ),
      ),
    ));
  });
  return Page;
};
