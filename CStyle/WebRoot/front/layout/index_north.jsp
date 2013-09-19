<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="index_front_north_wrapper">
	<div id="index_front_north_carousel">
		<img src="images/front/north/4.jpg"  width="900"	height="250" />
		<img src="images/front/north/3.jpg"  width="900" height="250" />
		<img src="images/front/north/2.jpg" 	 width="900" height="250" />
		<img src="images/front/north/1.jpg"  width="900" height="250" class="last" />
	</div>
	<div id="index_front_north_pager">
		<a title="111111" href="#"><span></span></a>
		<a title="222222" href="#"><span></span></a>
		<a title="333333" href="#"><span></span></a>
		<a title="444444" href="#"><span></span></a>
	</div>
</div>

<script type="text/javascript">
			function prevTimers() {
				return allTimers().slice( 0, $('#index_front_north_pager a.selected').index() );
			}
			function allTimers() {
				return $('#index_front_north_pager a span');
			}

			$(function() {
				$('#index_front_north_carousel').carouFredSel({
					items: 1,
					auto: {
						pauseOnHover: 'resume',
						progress: {
							bar: '#index_front_north_pager a:first span'
						}
					},
					scroll: {
						fx: 'crossfade',
						duration: 300,
						timeoutDuration: 2000,
						onAfter: function() {
							allTimers().stop().width( 0 );
							prevTimers().width( 225 );
							$(this).trigger('configuration', [ 'auto.progress.bar', '#index_front_north_pager a.selected span' ]);
						}
					},
					pagination: {
						container: '#index_front_north_pager',
						anchorBuilder: false
					}
				});
			});
		</script>