<a name="readme-top"></a>

<!--
HOW TO USE:
This is an example of how you may give instructions on setting up your project locally.

Modify this file to match your project and remove sections that don't apply.

REQUIRED SECTIONS:
- Table of Contents
- About the Project
  - Built With
  - Live Demo
- Getting Started
- Authors
- Future Features
- Contributing
- Show your support
- Acknowledgements
- License

OPTIONAL SECTIONS:
- FAQ

After you're finished please remove all the comments and instructions!
-->

<div align="center">
  <!-- You are encouraged to replace this logo with your own! Otherwise you can also remove it. -->
  <img src="murple_logo.png" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>Meeting For You</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [Meeting For You] <a name="about-project"></a>

[Meeting_For_You] addresses the challenge of scheduling pair programming sessions by providing a supportive community environment. Instead of tackling problems individually, this web app facilitates collaboration by bringing together two to three individuals to solve your problem together. With features such as scheduling assistance and the ability to discover new meetings with diverse participants, [Meeting_For_You] aims to streamline the process of organizing and participating in collaborative programming sessions.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>


<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby On Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> Describe between 1-3 key features of the application.

- **[Finding_pair_programming_sessions]**
- **[Scheduling_pair_programming_sessions]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- Not available due to time limitation

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>


To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

<!--
Example command:

```sh
 gem install rails
```
 -->

### Setup

Clone this repository to your desired folder:

<!--
Example commands:

```sh
  cd my-folder
  git clone git@github.com:myaccount/my-project.git
```
--->

```sh
  cd my-folder
  git clone https://github.com/heintayzar-hm/pair.git
```

### Install

Install gems with:

<!--
Example command:

```sh
  cd my-project
  gem install
```
--->

```sh
  cd pair
  bundle install
```

Setup database:
You might need to open `config/database.yml` and below the development

You might need to add your user name and password of your psql database,

```sh
database: pair_development
username: your_username
password: your_password
```

Create and run migrations and seed some data
```sh
  rails db:create db:migrate db:seed
```

### Usage

To run the project, execute the following command:

<!--
Example command:

```sh
  rails server
```
--->

```sh
  rails server
```

### Run tests

To run tests, run the following command:
- No tests right now

<!--
Example command:

```sh
  bin/rails test test/models/article_test.rb
```
--->

### Deployment

You can deploy this project using: Railway or render

<!--
Example:

```sh

```
 -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Hein Tay Zar**

- GitHub: [![Hein](https://img.shields.io/badge/-Hein_Tay_Zar-white?logo=GitHub&logoColor=181717&style=plastic)](https://github.com/heintayzar-hm)
- Twitter: [![heintayzar](https://img.shields.io/badge/-heintayzar-blue?logo=Twitter&logoColor=skyBlue&style=plastic)](https://twitter.com/heintayzarhm)
- LinkedIn: [![Hein-Tay-zar](https://img.shields.io/badge/-Hein_Tay_Zar-blue?logo=LinkedIn&logoColor=#0072b1&style=plastic)](https://www.linkedin.com/in/hein-tay-zar)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [ ] **[new_feature_1]**
- [ ] **[new_feature_2]**
- [ ] **[new_feature_3]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>


If you like this project, please give me a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>


I would like to thank [hacklah](https://hacklah.devpost.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

> Add at least 2 questions new developers would ask when they decide to use your project.

- **[Question_1]**

  - [Answer_1]

- **[Question_2]**

  - [Answer_2]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.


<p align="right">(<a href="#readme-top">back to top</a>)</p>
