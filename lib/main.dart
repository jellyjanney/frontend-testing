import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Book Club",
      home: Scaffold(
        body: MyHomePage(),
      ),
      theme: ThemeData(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.amber[50],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.purple,
            disabledColor: Colors.grey[350],
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.amber[50],
            titleTextStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.purple),
            iconTheme: IconThemeData(color: Colors.purple),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.amber[50],
            unselectedItemColor: Colors.purple,
            selectedItemColor: Colors.amber,
            showSelectedLabels: false,
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Club')),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage("assets/images/logo-book-club.png"),
            width: MediaQuery.of(context).size.height * 1,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              minimumSize: Size(double.infinity, 48),
            ),
            child: Text(
              'REGISTER',
              style: TextStyle(
                color: Colors.amber[50],
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              minimumSize: Size(double.infinity, 48),
            ),
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.amber[50],
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGIN')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/banner-login.png")),
            SizedBox(height: 20),
            Text('Email:'),
            TextField(),
            SizedBox(height: 16),
            Text('Password:'),
            TextField(
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.amber[50],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "OR",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  icon: Icon(Icons.facebook, size: 24),
                  label: Text(
                    "Login with Facebook",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  icon: Icon(Icons.g_mobiledata_sharp, size: 24),
                  label: Text(
                    "Login with Google",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int currentStep = 0;
  bool agreedToConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('REGISTER - Step ${currentStep + 1} /4')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Stepper(
            currentStep: currentStep,
            onStepContinue: () {
              if (currentStep < 3) {
                setState(() {
                  currentStep += 1;
                });
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              }
            },
            onStepCancel: () {
              if (currentStep > 0) {
                setState(() {
                  currentStep -= 1;
                });
              }
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: details.onStepCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[50],
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    child: Text(
                      "Prev",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                        color: Colors.amber[50],
                      ),
                    ),
                  ),
                ],
              );
            },
            steps: <Step>[
              Step(
                title: Text('CREATE ACCOUNT'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Password'),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Confirm Password'),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Step(
                title: Text('INFORMATION'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name (Thai)'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Surname (Thai)'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Name (English)'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Surname (English)'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Step(
                title: Text('ADDRESS'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address (Line 1)'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            hintText:
                                'House Number, Village Number, Village Name')),
                    SizedBox(height: 16),
                    Text('Address (Line 2)'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            hintText: 'Sub-street name, Street Name')),
                    SizedBox(height: 16),
                    Text('Sub District'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Distric'),
                    TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10))),
                    SizedBox(height: 16),
                    Text('Province'),
                    TextField(),
                    SizedBox(height: 16),
                    Text('Zip Code'),
                    TextField(),
                    SizedBox(height: 16),
                    Text('Phone Number'),
                    TextField(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Step(
                title: Text('VERIFICATION'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                          color: Colors.black,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Terms & Condition',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: agreedToConditions,
                          onChanged: (bool? value) {
                            setState(() {
                              agreedToConditions = true;
                            });
                          },
                        ),
                        Text('I agree to the terms and conditions.'),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 4.0,
        shadowColor: Theme.of(context).shadowColor,
        title: Text("Book Club"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Image(image: AssetImage("assets/images/banner-success.png")),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'BookShelf',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My Account',
          ),
        ],
      ),
    );
  }
}
