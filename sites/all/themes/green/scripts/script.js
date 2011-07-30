navx=function(){
	var nav = document.getElementById('menu-primary');
  if (nav != null) {
    var LIs = nav.getElementsByTagName('li');
    for(i=0; i<LIs.length; i++){
      if(LIs[i].ul=LIs[i].getElementsByTagName('ul')[0]){
        LIs[i].onmouseover=function(){
          //this.ul.style.display='inline';
          this.className = ' hover';
        }
        LIs[i].onmouseout=function(){
          //this.ul.style.display='none';
          str=this.className;
          this.className=str.replace(/hover/,'');
        }
      }
    }
  }
}
if (window.attachEvent) {
	window.attachEvent("onload", navx);
} else {
	onload=navx;
}