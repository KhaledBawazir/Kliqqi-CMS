{************************************
******* User Settings Template ******
*************************************}
<!-- profile_center.tpl -->
{checkActionsTpl location="tpl_pligg_profile_start"}
<div class="row-fluid" style="margin-bottom:10px;">
	<div class="span9">
		<h1 style="margin-bottom:0px;">
			{if $UseAvatars neq "0"}
				<a href="#profileavatar" data-toggle="modal">
					<div class="thumbnail avatar_thumb">
						<img style="float:left;margin:0 15px 0 0;" src="{$Avatar.large}" style="margin-bottom:4px;" alt="Avatar" />
						<a href="#profileavatar" data-toggle="modal" class="btn btn-small edit-avatar">Edit Avatar</a>
					</div>
				</a>
				{* Avatar upload modal *}
				<div class="modal hide fade" id="profileavatar" style="display: none;">
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">&times;</button>
						<h3>Profile Avatar Upload</h3>
					</div>
					<div class="modal-body">
						<form method="POST" enctype="multipart/form-data" name="image_upload_form" action="{$form_action}">
						<script type="text/javascript">
							$('.fileupload').fileupload()
						</script>
	
						<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="fileupload-new thumbnail">
								<img src="{$Avatar.large}" title="{#PLIGG_Visual_Profile_CurrentAvatar#}" />
							</div>
							<div class="fileupload-preview fileupload-exists thumbnail" style="max-width:{$Avatar_Large}px;max-height:{$Avatar_Large}px;"></div>
							<div>
								<span class="btn btn-file">
									<span class="fileupload-new"><i class="icon icon-picture"></i> Browse</span>
									<span class="fileupload-exists"><i class="icon icon-picture"></i> Browse</span>
									<input type="file" class="fileupload" name="image_file"/>
								</span>
								<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
							</div>
						</div>
						
					</div>
					<div class="modal-footer">
						<input type="hidden" name="avatar" value="uploaded"/>
						{$hidden_token_profile_change}
						<input type="submit" name="action" class="btn btn-primary" value="{#PLIGG_Visual_Profile_AvatarUpload#}"/>
						</form>
					</div>
				</div>
			{/if}
			{$user_username|capitalize}
		</h1>
		<div>
			{checkActionsTpl location="tpl_user_profile_social_start"}
			{if $user_skype}
				<a href="callto://{$user_skype}" title="Skype {$user_username|capitalize}" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/skype_round.png" /></a>
			{/if}
			{if $user_facebook}
				<a href="http://www.facebook.com/{$user_facebook}" title="{$user_username|capitalize} on Facebook" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/facebook_round.png" /></a>
			{/if}
			{if $user_twitter}
				<a href="http://twitter.com/{$user_twitter}" title="{$user_username|capitalize} on Twitter" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/twitter_round.png" /></a>
			{/if}
			{if $user_linkedin}
				<a href="http://www.linkedin.com/in/{$user_linkedin}" title="{$user_username|capitalize} on LinkedIn" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/linkedin_round.png" /></a>
			{/if}
			{if $user_googleplus}
				<a href="https://plus.google.com/{$user_googleplus}" title="{$user_username|capitalize} on Google+" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/google_round.png" /></a>
			{/if}
			{if $user_pinterest}
				<a href="http://pinterest.com/{$user_pinterest}/" title="{$user_username|capitalize} on Pinterest" rel="nofollow" target="_blank"><img src="{$my_pligg_base}/templates/{$the_template}/img/pinterest_round.png" /></a>
			{/if}
			{checkActionsTpl location="tpl_user_profile_social_end"}
		</div>
		{checkActionsTpl location="tpl_show_extra_profile"}
		<div style="font-size:0.85em;line-height:1.3em;margin-top:2px;">		
			{if $user_publicemail ne ""}
				{php}
					// Method to try to trick automated email address collection bots
					global $main_smarty;
					$full_email = $this->_vars['user_publicemail'];
					list($email_start,$_) = explode('@',$full_email); $email_domain = ''.$_;
					$main_smarty->assign('email_start', $email_start);
					$main_smarty->assign('email_domain', $email_domain);
				{/php}
				<script type="text/javascript">
				<!--
					var string1 = "{$email_start}";
					var string2 = "@";
					var string3 = "{$email_domain}";
				//  document.write(string4);
					document.write("<a href=" + "mail" + "to:" + string1 + string2 + string3 + ">Email</a> | ");
				//-->
				</script>
			{/if}
			{if $user_url != "" && $user_karma > "20" || $user_login eq $user_logged_in}
				<a href="{$user_url}" target="_blank" rel="nofollow">{$user_url}</a>
				<br />
			{/if}
			{checkActionsTpl location="tpl_user_profile_details_start"}
			{if $user_names != ""}
				{$user_names}
				{if $user_occupation != "" || $user_location != ""}	is {/if}
			{/if}
			{if $user_occupation != ""}
				{if $user_names != ""} a {/if}
				{$user_occupation}
			{/if}
			{if $user_location != ""}
				{if $user_occupation != "" || $user_names != ""}
					 from 
				{elseif $user_location != ""}
					 From 
				{/if}
				{$user_location}
			{/if}
			{checkActionsTpl location="tpl_user_profile_details_end"}
		</div>
	</div>
	<div id="user_search" class="span3">
		<div style="float:right;text-align:right;">
			<form action="{$my_pligg_base}/user.php" method="get" {php} global $URLMethod, $my_base_url, $my_pligg_base; if ($URLMethod==2) print "onsubmit='document.location.href=\"{$my_base_url}{$my_pligg_base}/user/search/\"+encodeURIComponent(this.keyword.value); return false;'";{/php}>
				<div class="input-append">
					<input type="hidden" name="view" value="search">
					<input type="text" name="keyword" class="input-medium" placeholder="{#PLIGG_Visual_User_Search_Users#}"><button type="submit" class="btn">{#PLIGG_Visual_Search_Go#}</button>
				</div>
			</form>	
			<div class="btn-group">
				<a class="btn btn-small" href="{$user_url_friends}"><i class="icon-user"></i> {$following|@count} {#PLIGG_Visual_User_Profile_View_Friends#}</a>
				<a class="btn btn-small" href="{$user_url_friends2}"><i class="icon-user"></i> {$follower|@count} {#PLIGG_Visual_User_Profile_Your_Friends#}</a>
			</div> 
			{if $user_login neq $user_logged_in}
				{if check_for_enabled_module('simple_messaging',0.6) && $is_friend}
					{if $friends}
						<img src="{$my_pligg_base}/modules/simple_messaging/img/reply.png" border="0" align="absmiddle" /> <a href="{$my_pligg_base}/module.php?module=simple_messaging&view=compose&return={$templatelite.server.REQUEST_URI|urlencode}&to={$user_login}">{#PLIGG_Visual_User_Profile_Message#} {$user_login}</a>
					{/if}
				{/if}
				{if $is_friend gt 0}
					<a href="{$user_url_remove}" class="btn btn-small btn-danger">{#PLIGG_Unfollow#}{* {$user_login|capitalize} *}</a>
					{if $user_authenticated eq true}
						{checkActionsTpl location="tpl_user_center"}
					{/if}
				{else}
					{if $user_authenticated eq true} 					
						<img src="{$my_pligg_base}/templates/{$the_template}/img/user_add.gif" align="absmiddle" /> <a href="{$user_url_add}">{#PLIGG_Visual_User_Profile_Add_Friend#} {$user_login}</a>
					{/if}   
				{/if}
			{/if}
		</div>
	</div>
	<div style="clear:both;"></div>
</div>

{checkActionsTpl location="tpl_user_center_just_below_header"}
<ul class="nav nav-tabs" id="profiletabs">
	{checkActionsTpl location="tpl_pligg_profile_sort_start"}
	<li><a href="{$user_url_personal_data}">{#PLIGG_Visual_User_PersonalData#}</a></li>
	<li class="active"><a href="{$user_url_setting}">{#PLIGG_Visual_User_Setting#}</a></li>
	<li><a href="{$user_url_news_sent}">{#PLIGG_Visual_User_NewsSent#}</a></li>
	<li><a href="{$user_url_news_published}">{#PLIGG_Visual_User_NewsPublished#}</a></li>
	<li><a href="{$user_url_news_unpublished}">{#PLIGG_Visual_User_NewsUnPublished#}</a></li>
	<li><a href="{$user_url_commented}">{#PLIGG_Visual_User_NewsCommented#}</a></li>
	<li><a href="{$user_url_news_voted}">{#PLIGG_Visual_User_NewsVoted#}</a></li>
	<li><a href="{$user_url_saved}">{#PLIGG_Visual_User_NewsSaved#}</a></li>
	{checkActionsTpl location="tpl_pligg_profile_sort_end"}
</ul>
{if $savemsg neq ""}<div class="alert alert-warning fade in"><a data-dismiss="alert" class="close">&times;</a>{$savemsg}</div>{/if} 
{checkActionsTpl location="tpl_pligg_profile_info_start"}
<form action="" method="post" id="thisform">
	<div id="profile_container" style="position: relative;">
		{checkActionsTpl location="tpl_profile_center_fields"}
		{checkActionsTpl location="tpl_pligg_profile_info_middle"}
		<table class="masonry table table-bordered table-striped span4">
			<thead class="table_title">
				<tr>
					<th colspan="2">{#PLIGG_Visual_Profile_ModifyProfile#}</th>
				</tr>
			</thead>
			<tbody>
				{if $userlevel eq 'admin' or $userlevel eq 'moderator'}
					<tr>
						<td><label for="user_login" accesskey="1">{#PLIGG_Visual_Register_Username#}:</label></td>
						<td><input type="text" name="user_login" id="names" tabindex="1" value="{$user_login}"></td>
					</tr>
				{/if}
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_Profile_Email#}:</label></td>
					<td><input type="text" name="email" id="email" tabindex="3" value="{$user_email}">
						<br /><em>{#PLIGG_Visual_Profile_OnlyAdmins#}</em></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_User_Profile_PublicEmail#}:</label></td>
					<td><input type="text" name="public_email" id="public_email" tabindex="5" value="{$user_publicemail}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_User_Profile_Homepage#}:</label></td>
					<td><input type="text" name="url" id="url" tabindex="7" value="{$user_url}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_Profile_RealName#}:</label></td>
					<td><input type="text" name="names" id="names" tabindex="1" value="{$user_names}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_Profile_Occupation#}:</label></td>
					<td><input type="text" name="occupation" id="occupation" tabindex="11" value="{$user_occupation}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_Profile_Location#}:</label></td>
					<td><input type="text" name="location" id="location" tabindex="9" value="{$user_location}"></td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="2">{#PLIGG_User_Profile_Social#}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_Visual_User_Profile_Skype#}:</label></td>
					<td><input type="text" name="skype" id="skype" tabindex="10" value="{$user_skype}"></td>
				</tr>
				
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_User_Profile_Facebook#}:</label></td>
					<td><input type="text" name="facebook" id="facebook" tabindex="2" value="{$user_facebook}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_User_Profile_Twitter#}:</label></td>
					<td><input type="text" name="twitter" id="twitter" tabindex="4" value="{$user_twitter}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_User_Profile_Linkedin#}:</label></td>
					<td><input type="text" name="linkedin" id="linkedin" tabindex="6" value="{$user_linkedin}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_User_Profile_Googleplus#}:</label></td>
					<td><input type="text" name="googleplus" id="googleplus" tabindex="8" value="{$user_googleplus}"></td>
				</tr>
				<tr>
					<td><label for="name" accesskey="1">{#PLIGG_User_Profile_Pinterest#}:</label></td>
					<td><input type="text" name="pinterest" id="pinterest" tabindex="12" value="{$user_pinterest}"></td>	
				</tr>
			</tbody>
		</table>
		{checkActionsTpl location="tpl_pligg_profile_settings_start"}		
		<table class="masonry table table-bordered table-striped span4">
			<thead class="table_title">
				<tr>
					<th colspan="2">{#PLIGG_User_Display_Settings#}</th>
				</tr>
			</thead>
			<tbody>
				{php}
				if (user_language)
				{
				{/php}
					{*if count($languages) gt 1*}
						<tr>
							<td><label for="name" accesskey="1">{#PLIGG_Visual_User_Profile_Language#}:</label></td>
							<td><select name='language'>
									{foreach from=$languages value=lang}
										<option {if $lang==$user_language}selected{/if}>{$lang|capitalize}</option>
									{/foreach}
								</select>
							</td>
						</tr>
					{*/if*}
				{php}
				}
				{/php}
				{if $Allow_User_Change_Templates}
					{if count($templates) gt 1}
						<tr>
							<td><label>{#PLIGG_Visual_User_Setting_Template#}:</label></td>
							<td><select name='template'>
							{foreach from=$templates item=template}
								<option {if $template==$current_template}selected{/if}>{$template|capitalize}</option>
							{/foreach}
							</select>
							</td>
						</tr>
					{/if}
				{/if}
				<tr>
					<td><label>{#PLIGG_Visual_User_Setting_Categories#}:</label></td>
					<td>
					{foreach from=$category item=cat name="cate"}
						<input type="checkbox" name="chack[]" value="{$cat.category__auto_id}" {if !in_array($cat.category__auto_id,$user_category)} checked="checked"{/if}>
						{$cat.category_name}<br/>
					{/foreach}
					</td>
				</tr>
			</tbody>
		</table>
		{checkActionsTpl location="tpl_pligg_profile_settings_end"}
		<table class="masonry table table-bordered table-striped span4">
			<thead class="table_title">
				<tr>
					<th colspan="2">{#PLIGG_Visual_Profile_ChangePass#}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>{#PLIGG_Visual_Profile_OldPass#}:</label></td>
					<td><input type="password" id="oldpassword" name="oldpassword" size="25" tabindex="13"/></td>
				</tr>
				<tr>
					<td><label>{#PLIGG_Visual_Profile_NewPass#}:</label></td>
					<td><input type="password" id="newpassword" name="newpassword" size="25" tabindex="14"/></td>
				</tr>
				<tr>
					<td><label>{#PLIGG_Visual_Profile_VerifyNewPass#}:</label></td>
					<td><input type="password" id="verify" name="newpassword2" size="25" tabindex="15"/></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="clear:both;"></div>
	<div class="form-actions">
		{$hidden_token_profile_change}
		<input type="hidden" name="process" value="1">
		<input type="hidden" name="user_id" value="{$user_id}">	
		<input type="submit" name="save_profile" value="{#PLIGG_Visual_Profile_Save#}" class="btn btn-primary" tabindex="16">
	</div>
</form>
{checkActionsTpl location="tpl_pligg_profile_end"}
<!--/profile_center.tpl -->