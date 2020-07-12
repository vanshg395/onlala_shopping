import 'package:flutter/material.dart';

import '../widgets/common_button.dart';
import '../widgets/profile_field.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    // image: CachedNetworkImageProvider(url)
                    // fit: BoxFit.cover,
                    // ),
                  ),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CommonButton(
                  title: 'Change Image',
                  onPressed: () {},
                  fontSize: 18,
                  borderRadius: 10,
                  bgColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ProfileField(
                  label: 'First Name',
                  initialData: '',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ProfileField(
                  label: 'Last Name',
                  initialData: '',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ProfileField(
                  label: 'Email',
                  initialData: '',
                  enabled: false,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ProfileField(
                  label: 'Password',
                  initialData: '',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ProfileField(
                  label: 'Phone Number',
                  initialData: '',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ProfileField(
                  label: 'Company Name',
                  initialData: '',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  'Documents',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 20,
              //     vertical: 30,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         blurRadius: 2,
              //         spreadRadius: 0.1,
              //         color: Colors.grey,
              //         offset: Offset(0, 1),
              //       ),
              //     ],
              //   ),
              //   width: double.infinity,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         'IEC Certificate/Import Export Licence',
              //         style: Theme.of(context).primaryTextTheme.body1,
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       if (Provider.of<Auth>(context, listen: false)
              //               .docs
              //               .where((doc) => doc['file_type'] == 'IEC_Certificate')
              //               .toList()
              //               .length ==
              //           0)
              //         _isLoadings[0]
              //             ? Center(
              //                 child: CircularProgressIndicator(
              //                   valueColor: AlwaysStoppedAnimation(
              //                     Theme.of(context).primaryColor,
              //                   ),
              //                 ),
              //               )
              //             : CommonButton(
              //                 bgColor: Color(0xFFE9F0F3),
              //                 borderColor: Color(0xFFE9F0F3),
              //                 title: 'Upload File',
              //                 textColor: Theme.of(context).primaryColor,
              //                 fontSize: 16,
              //                 width: double.infinity,
              //                 borderRadius: 5,
              //                 onPressed: () => uploadDoc(0, 'IEC_Certificate'),
              //               )
              //       else
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             Text(
              //               Provider.of<Auth>(context, listen: false)
              //                       .docs
              //                       .where((doc) =>
              //                           doc['file_type'] == 'IEC_Certificate')
              //                       .toList()[0]['review']
              //                   ? 'Document Approved'
              //                   : 'Approval Pending',
              //               style: Theme.of(context)
              //                   .primaryTextTheme
              //                   .body2
              //                   .copyWith(
              //                     color: Provider.of<Auth>(context, listen: false)
              //                             .docs
              //                             .where((doc) =>
              //                                 doc['file_type'] ==
              //                                 'IEC_Certificate')
              //                             .toList()[0]['review']
              //                         ? Colors.green
              //                         : Colors.amber,
              //                   ),
              //             ),
              //             InkWell(
              //               child: Icon(
              //                 Icons.cloud_download,
              //                 color: Theme.of(context).primaryColor,
              //               ),
              //               onTap: () async {
              //                 if (await canLaunch(
              //                     Provider.of<Auth>(context, listen: false)
              //                         .docs
              //                         .where((doc) =>
              //                             doc['file_type'] == 'IEC_Certificate')
              //                         .toList()[0]['document'])) {
              //                   await launch(
              //                       Provider.of<Auth>(context, listen: false)
              //                           .docs
              //                           .where((doc) =>
              //                               doc['file_type'] == 'IEC_Certificate')
              //                           .toList()[0]['document']);
              //                 }
              //               },
              //             ),
              //           ],
              //         ),
              //       SizedBox(
              //         height: 30,
              //       ),
              //       Text(
              //         'Company Registration Certificate/Equivalent Certificate',
              //         style: Theme.of(context).primaryTextTheme.body1,
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       if (Provider.of<Auth>(context, listen: false)
              //               .docs
              //               .where((doc) =>
              //                   doc['file_type'] ==
              //                   'Company Registration Certificate')
              //               .toList()
              //               .length ==
              //           0)
              //         _isLoadings[1]
              //             ? Center(
              //                 child: CircularProgressIndicator(
              //                   valueColor: AlwaysStoppedAnimation(
              //                     Theme.of(context).primaryColor,
              //                   ),
              //                 ),
              //               )
              //             : CommonButton(
              //                 bgColor: Color(0xFFE9F0F3),
              //                 borderColor: Color(0xFFE9F0F3),
              //                 title: 'Upload File',
              //                 textColor: Theme.of(context).primaryColor,
              //                 fontSize: 16,
              //                 width: double.infinity,
              //                 borderRadius: 5,
              //                 onPressed: () => uploadDoc(
              //                     1, 'Company Registration Certificate'),
              //               )
              //       else
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             Text(
              //               Provider.of<Auth>(context, listen: false)
              //                       .docs
              //                       .where((doc) =>
              //                           doc['file_type'] ==
              //                           'Company Registration Certificate')
              //                       .toList()[0]['review']
              //                   ? 'Document Approved'
              //                   : 'Approval Pending',
              //               style: Theme.of(context)
              //                   .primaryTextTheme
              //                   .body2
              //                   .copyWith(
              //                     color: Provider.of<Auth>(context, listen: false)
              //                             .docs
              //                             .where((doc) =>
              //                                 doc['file_type'] ==
              //                                 'Company Registration Certificate')
              //                             .toList()[0]['review']
              //                         ? Colors.green
              //                         : Colors.amber,
              //                   ),
              //             ),
              //             InkWell(
              //               child: Icon(
              //                 Icons.cloud_download,
              //                 color: Theme.of(context).primaryColor,
              //               ),
              //               onTap: () async {
              //                 if (await canLaunch(
              //                     Provider.of<Auth>(context, listen: false)
              //                         .docs
              //                         .where((doc) =>
              //                             doc['file_type'] ==
              //                             'Company Registration Certificate')
              //                         .toList()[0]['document'])) {
              //                   await launch(
              //                       Provider.of<Auth>(context, listen: false)
              //                           .docs
              //                           .where((doc) =>
              //                               doc['file_type'] ==
              //                               'Company Registration Certificate')
              //                           .toList()[0]['document']);
              //                 }
              //               },
              //             ),
              //           ],
              //         ),
              //       SizedBox(
              //         height: 30,
              //       ),
              //       Text(
              //         'GST Certificate/Tax Certificate',
              //         style: Theme.of(context).primaryTextTheme.body1,
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       if (Provider.of<Auth>(context, listen: false)
              //               .docs
              //               .where((doc) => doc['file_type'] == 'GST Certificate')
              //               .toList()
              //               .length ==
              //           0)
              //         _isLoadings[2]
              //             ? Center(
              //                 child: CircularProgressIndicator(
              //                   valueColor: AlwaysStoppedAnimation(
              //                     Theme.of(context).primaryColor,
              //                   ),
              //                 ),
              //               )
              //             : CommonButton(
              //                 bgColor: Color(0xFFE9F0F3),
              //                 borderColor: Color(0xFFE9F0F3),
              //                 title: 'Upload File',
              //                 textColor: Theme.of(context).primaryColor,
              //                 fontSize: 16,
              //                 width: double.infinity,
              //                 borderRadius: 5,
              //                 onPressed: () => uploadDoc(2, 'GST Certificate'),
              //               )
              //       else
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             Text(
              //               Provider.of<Auth>(context, listen: false)
              //                       .docs
              //                       .where((doc) =>
              //                           doc['file_type'] == 'GST Certificate')
              //                       .toList()[0]['review']
              //                   ? 'Document Approved'
              //                   : 'Approval Pending',
              //               style: Theme.of(context)
              //                   .primaryTextTheme
              //                   .body2
              //                   .copyWith(
              //                     color: Provider.of<Auth>(context, listen: false)
              //                             .docs
              //                             .where((doc) =>
              //                                 doc['file_type'] ==
              //                                 'GST Certificate')
              //                             .toList()[0]['review']
              //                         ? Colors.green
              //                         : Colors.amber,
              //                   ),
              //             ),
              //             InkWell(
              //               child: Icon(
              //                 Icons.cloud_download,
              //                 color: Theme.of(context).primaryColor,
              //               ),
              //               onTap: () async {
              //                 if (await canLaunch(
              //                     Provider.of<Auth>(context, listen: false)
              //                         .docs
              //                         .where((doc) =>
              //                             doc['file_type'] == 'GST Certificate')
              //                         .toList()[0]['document'])) {
              //                   await launch(
              //                       Provider.of<Auth>(context, listen: false)
              //                           .docs
              //                           .where((doc) =>
              //                               doc['file_type'] == 'GST Certificate')
              //                           .toList()[0]['document']);
              //                 }
              //               },
              //             ),
              //           ],
              //         ),
              //       SizedBox(
              //         height: 30,
              //       ),
              //       Text(
              //         'Shop & Establishment Licence/Equivalent Other Certificate',
              //         style: Theme.of(context).primaryTextTheme.body1,
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       if (Provider.of<Auth>(context, listen: false)
              //               .docs
              //               .where((doc) =>
              //                   doc['file_type'] ==
              //                   'Shop And Establishment Certificate')
              //               .toList()
              //               .length ==
              //           0)
              //         _isLoadings[3]
              //             ? Center(
              //                 child: CircularProgressIndicator(
              //                   valueColor: AlwaysStoppedAnimation(
              //                     Theme.of(context).primaryColor,
              //                   ),
              //                 ),
              //               )
              //             : CommonButton(
              //                 bgColor: Color(0xFFE9F0F3),
              //                 borderColor: Color(0xFFE9F0F3),
              //                 title: 'Upload File',
              //                 textColor: Theme.of(context).primaryColor,
              //                 fontSize: 16,
              //                 width: double.infinity,
              //                 borderRadius: 5,
              //                 onPressed: () => uploadDoc(
              //                     3, 'Shop And Establishment Certificate'),
              //               )
              //       else
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             Text(
              //               Provider.of<Auth>(context, listen: false)
              //                       .docs
              //                       .where((doc) =>
              //                           doc['file_type'] ==
              //                           'Shop And Establishment Certificate')
              //                       .toList()[0]['review']
              //                   ? 'Document Approved'
              //                   : 'Approval Pending',
              //               style: Theme.of(context)
              //                   .primaryTextTheme
              //                   .body2
              //                   .copyWith(
              //                     color: Provider.of<Auth>(context, listen: false)
              //                             .docs
              //                             .where((doc) =>
              //                                 doc['file_type'] ==
              //                                 'Shop And Establishment Certificate')
              //                             .toList()[0]['review']
              //                         ? Colors.green
              //                         : Colors.amber,
              //                   ),
              //             ),
              //             InkWell(
              //               child: Icon(
              //                 Icons.cloud_download,
              //                 color: Theme.of(context).primaryColor,
              //               ),
              //               onTap: () async {
              //                 if (await canLaunch(
              //                     Provider.of<Auth>(context, listen: false)
              //                         .docs
              //                         .where((doc) =>
              //                             doc['file_type'] ==
              //                             'Shop And Establishment Certificate')
              //                         .toList()[0]['document'])) {
              //                   await launch(
              //                       Provider.of<Auth>(context, listen: false)
              //                           .docs
              //                           .where((doc) =>
              //                               doc['file_type'] ==
              //                               'Shop And Establishment Certificate')
              //                           .toList()[0]['document']);
              //                 }
              //               },
              //             ),
              //           ],
              //         ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
