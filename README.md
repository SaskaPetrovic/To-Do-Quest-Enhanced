<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>

## To Do Quest ٩(^ᗜ^ )و ´-

<h3 align="center">Level up your productivity (˵ •̀ ᴗ - ˵ ) ✧

</br> ![](https://media1.tenor.com/m/FR8tb3ArfpMAAAAd/level-up-fantasy-bishoujo-juniku-ojisan-to.gif) </h3>
</br> 


## 𐙚 Table of Contents

➺ [About the Project](#about-the-project)  

➺ [Technologies & Environment](#technologies--environment)  

➺ [Key Features](#key-features)  

➺ [Getting Started](#getting-started)  

➺ [Usage](#usage)  

➺ [Screenshots](#screenshots)  

➺ [Contact](#contact)

</br> 
<!-- ## 📖 About the Project  -->
<h2 name="about-the-project">𐙚 About the project </h2>

To-Do Quest is a task management platform built using Ruby on Rails, with Bootstrap for styling and JavaScript for interactivity. Initially designed for mobile, this project has now been enhanced to support a desktop version as well, offering a more versatile and user-friendly experience across devices.

This app combines the practicality of task management with a gamified RPG experience. Users track their personalized stats and level up by completing quests to earn achievements and boost their abilities, making productivity both fun and rewarding.

The project provides a dynamic and engaging way to manage tasks, set priorities, and track progress through customizable quests and a unique RPG experience. Each user has their own stats, which are updated as they complete objectives. Achievements are unlocked as progress is made, all within the flexibility of both mobile and desktop formats.

</br> 

**Note:** This project builds upon the original [To-Do Quest](https://github.com/SaskaPetrovic/To-Do-Quest.git), which was a collaborative effort with members of my group. I cloned the repository and made changes independently without impacting the original project.


</br> 

![Ruby on Rails](https://img.shields.io/badge/Ruby%20on%20Rails-7.0.4-cc0000)  
![Ruby](https://img.shields.io/badge/Ruby-3.1.0-red)  
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.1.3-7952b3)  
![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow)  
![Seed Data](https://img.shields.io/badge/Seed%20Data-Used-blue)

</br> 

<h2 name="technologies--environment">𐙚 Technologies & Environment </h2>

✦︎ Ruby on Rails 7.0.4

✦︎ JavaScript ES6

✦︎ Bootstrap 5.3

✦︎ Chart.js (for task progress tracking)

✦︎ Visual Studio Code
</br> 


<h2 name="key-features">𐙚 Key Features </h2>

𖤝 **Intro Page & New Game**  
- Welcome page with an option to create a new game or continue  
- Background music for a more immersive experience

𖤝 **Homepage (Character Dashboard)**  
- Displays player's username, level and different stats (INT, MANA, DEX, STR, CHA)  
- Class unlocks after 5 points are earned
- Progress bar shows the XP progress to the next level
- Profile photo (unchangeable)

𖤝 **Activity Tab**  
- Displays your weekly quest goal (unchangeable)
- Shows the number of active quests

𖤝 **Stats Tab**  
- Visualizes your current stats (INT, MANA, DEX, STR, CHA) with an interactive spider chart (Chart.js)

𖤝 **Quest Page**  
- View available quests
- Predefined quests : 5 quests per category 
- Create custom quests : Add title, description, category, duration, priority level, and checkpoints  
- Quest details : Click on a quest for detailed info and accept it to start the quest

𖤝 **Active Quests**  
- Once accepted, quests appear in the Active Quests tab 
- Track progress and complete quests to gain experience and rewards

𖤝 **Achievements**  
- Achievements pop up as you complete quests
- View progress on the Achievements Page

</br> 


<h2 name="getting-started">𐙚 Getting Started </h2>

### Requirements  
✦︎ Ruby >= 3.0

✦︎ Rails >= 7.0

✦︎ Node.js (for JavaScript & asset management)
</br> 

### Setup
(ㅅ´ ˘ `)


Clone the GitHub repository using the following command 

```bash
git clone git@github.com:SaskaPetrovic/To-Do-Quest-Enhanced.git
```

Install all the dependencies of the project

```bash
bundle install

```

Install JavaScript dependencies

```bash
npm install

```

Setup the database by running the following command

```bash
rails db:create
rails db:migrate
rails db:seed

```

Start the Rails development server

```bash
rails server

```

Access the project

```bash
http://localhost:3000

```

(づ ᴗ _ᴗ)づ♡

</br> 
<h2 name="usage">𐙚 Usage </h2>

𖹭 Start a new game or continue from your last save on the introduction page

𖹭 Track your level, stats, and progression on the main dashboard

𖹭 View weekly goals and your current quest count in the Activity tab

𖹭 Browse predefined quests or create your own with custom checkpoints

𖹭 Accept quests, complete them, and watch your stats grow

𖹭 View your unlocked achievements and progress toward new milestones
</br> 

<h2 name="screenshots">𐙚 Screenshots </h2>

### Introduction Screen
<p align="left">
  <img src="public/screenshot-Menu.png" width="30%" />
</p>

### Dashboard
<p align="left">
  <img src="public/screenshot-activity.png" width="30%" />
   <img src="public/screenshot-chart.png" width="30%" />
</p>

### Quest Overview
<p align="left">
  <img src="public/screenshot-ongoing.png" width="30%" />
  <img src="public/screenshot-quests.png" width="30%" />
  <img src="public/screenshot-add.png" width="30%" />
</p>

### Quest Details
<p align="left">
  <img src="public/screenshot-task.png" width="30%" />
</p>

### Achievements Page
<p align="left">
  <img src="public/screenshot-achievement.png" width="30%" />
</p>


( ꈍ◡ꈍ)


</br> 
<h2 name="contact">☕︎ Connect with me</h2>

˗ˏˋ ✉︎ ˎˊ˗  **saskapetrovic.pro@gmail.com**

˗ˏˋ ✎ ˎˊ˗  [LinkedIn](https://www.linkedin.com/in/saska-petrovic-2137072a2)
