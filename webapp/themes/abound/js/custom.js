/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function blinker(){
    $('.blink').fadeOut(500);
    $('.blink').fadeIn(700);
}
setInterval(blinker,1000);