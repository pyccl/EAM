<script type="text/javascript">
	function position() {
		var d = document.getElementById('tip');
		d.style.visibility = 'visible';
		d.style.left = event.screenX-185 + 'px';
		d.style.top = event.screenY-155 + 'px';
	}
	function hide() {
		document.getElementById('tip').style.visibility = 'hidden';
	}
</script>