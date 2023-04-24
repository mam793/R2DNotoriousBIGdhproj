"use strict";
/* 
 * Attach event listener to all <li> elements in song list
 */
function init() {
    var titleLinks = document.querySelectorAll('nav li');
    for (var i = 0, len = titleLinks.length; i < len; i++) {
        titleLinks[i].addEventListener('click', toggleView, false);
    }
}
/* 
 * Hide all songs and then show the one that was selected
 * Assumes that the @id of a clickable title is the same as the
 *   @id of the corresponding song except that the title prefixes
 *   the string "title_", e.g., "title_Intro" and "Intro"
 */
function toggleView() {
  var allSongs = document.getElementsByClassName('song');
  for (var i = 0, len = allSongs.length; i < len; i++) {
    allSongs[i].style.display = 'none';
  }
  document.getElementById(this.id.replace(/^title_/, '')).style.display = 'block';
}
/* 
 * Fire init() function only once entire page has loaded
 */
window.addEventListener('DOMContentLoaded', init, false);