<img src="/img/readMeImages/Logo.png" width="350" height="275">

<b>Description:</b><br />
Matthew Del Fante and Molli Drivdahl (Team (MD)^2) will be collaborating together to make an animated music video by the end of the term. The music video will be made from scratch to go along with the song "My House" by Flo Rida. The idea of the music video is that Matt, Molli and Flo Rida are giving house tours of their dream houses throughout the music video.

<b>Technologies:</b><br />
C++, Qt, QML, Javascript <br />

<b>Screenshots:</b>

<img src= "/img/readMeImages/splashScreen.jpg" width="500" height="300">
<br />
Opening splash screen/menu for the music video.

<img src= "/img/readMeImages/mattOnStairs.jpg" width="500" height="300">
<br />
Matt giving a tour of his dream house.

<img src= "/img/readMeImages/mattMolliDanceFloor.jpg" width="500" height="300">
<br />
Matt and Molli dancing on a dancefloor.

<img src= "/img/readMeImages/molliHammock.jpg" width="500" height="300">
<br />
Molli giving a tour of her dream house.

<img src= "/img/readMeImages/floRidaPerforming.jpg" width="500" height="300">
<br />
Flo Rida performing during the tour of his house.

<b>Installation Instructions:</b><br />
1.  Install Qt 5.6. <br \>
2.  Open project. <br \>
3.  Clean all, run qmake and build all. <br \>
4.  <b>Copy the images and sounds folders located in MyHouseMusicVideo\src\mdMusicVideo.</b> <br \>
5.  <b>Paste the images and sounds folders in:<br \>
   MyHouseMusicVideo\src\build-mdMusicVideo-Desktop_Qt_5_6_0_MSVC2015_64bit-Debug\debug.</b> <br \>
6.  Clean all, run qmake, build all, run and enjoy. <br \>

<b>Contribution Guidelines:</b><br />
Throughout the term, Molli Drivdahl and Matt Del Fante worked on the music video equally until the end of the term. For any future contributors to the project after the end of the term, development changes can be made by creating a pull request and doing what they please with the project.

<i>Note on naming convention:</i><br />
We preface all aliases with 2 letter identifiers that distinguish their types, followed by an underscore.
We preface c++ data members with an "m_" followed by the data members' names.

<b>Bugs, ToDo List and Revision History:</b><br />
<i>Bugs:</i></b><br />
1. Changing the size of the window as any animations are happening causes undefined behavior. <br />
2. Running the music video project (after clicking the green arrow) takes longer then most people would expect. <br />
3. Expanding the window full screen has unexpected effects on the location of components in the music video. It's best to view the music video with the window at an 8:5 aspect ratio. <br />

<i>ToDo List:</i></b><br />
1. Create an installer. <br />

<i>Revision History:</i></b><br />
1. Completed the first chorus of the song. <br />
2. Fixed timer bug where timers worked differently on different machines. <br />
3. Implemented more anchors to ensure the music video would look good (for the most part) with any sized window. <br /> 
4. Finished the second verse of the song. <br />
5. Finished the second chorus of the song. <br />
6. Finished the third verse of the song. <br />
7. Finished the third chorus of the song. <br />
8. Added credits to the end of the music video. <br />
9. Added a volume slider to the settings menu. <br />
10. Reduced build times exponentially. <br />
11. Added audio to the splash screen and credits. <br />
12. Added a volume slider to the music video. <br />
13. Added "Exit After Credits" setting and functionality (works like loop play when disabled). <br />
14. Synched all music video animations correctly to the music. <br />
15. Fixed champagne scene's "immediate popping" bug. <br />
16. Fixed bug so that the music video is always in synch with the song even when only building once. <br />
17. Updated the read me screen shots. <br />

<i>Things That Could Not Be Done Due To Time Constraints:</i></b><br />
1. Adding play/pause and setting buttons to the music video. <br />
2. Adding a functioning subtitles button that would display the song's lyrics with the music video. <br />

<b>Contributors:</b><br />
[MatthewDelFante](https://github.com/mattdelfante)<br />
[MolliDrivdahl](https://github.com/mollidrivdahl)<br />

<b>Inspiration:</b><br />
For Matt, the idea to make an animated music video came from the animated start menu of the example project "Bishop's Fianchetto" shown on the first day of the GUI course. For Molli, the idea came from a previous Adobe Flash project from high school involving creating animations to go along with a song. We picked My House by Flo Rida since it is catchy and we thought we could express ourselves easily and in a fun manner via house tours.<br />

<b>License:</b><br />
The MIT License (MIT)<br />
Copyright (c) 2016 mattdelfante<br />

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:<br />

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.<br />

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.<br />
