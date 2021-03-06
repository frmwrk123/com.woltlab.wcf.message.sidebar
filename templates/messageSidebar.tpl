{if !$__messageSidebarJavascript|isset}
	<script type="text/javascript">
		//<![CDATA[
		$(function() {
			WCF.Language.addObject({
				'wcf.user.activityPoint': '{lang}wcf.user.activityPoint{/lang}'
			});
			
			WCF.User.Profile.ActivityPointList.init();
		});
		//]]>
	</script>
	{assign var=__messageSidebarJavascript value=true}
{/if}

<aside class="messageSidebar">
	<div>
		{if $userProfile->userID}
			{assign var='username' value=$userProfile->username}
			
			<header>
				<h1 class="username">
					<a href="{link controller='User' object=$userProfile->getDecoratedObject()}{/link}" class="userLink" data-user-id="{@$userProfile->userID}">
						<span>{$username}</span>
					</a>
				</h1>
			</header>
			
			{if MESSAGE_SIDEBAR_ENABLE_AVATAR}
				{if $userProfile->getAvatar()}
					<div class="userAvatar">
						<a href="{link controller='User' object=$userProfile->getDecoratedObject()}{/link}" class="framed">{@$userProfile->getAvatar()->getImageTag(128)}</a>
						
						{if MESSAGE_SIDEBAR_ENABLE_ONLINE_STATUS && $userProfile->isOnline()}<span class="badge green badgeOnline" title="{lang}wcf.user.online.title{/lang}">{lang}wcf.user.online{/lang}</span>{/if}
					</div>
				{/if}
			{/if}
			
			{if MODULE_USER_RANK && MESSAGE_SIDEBAR_ENABLE_RANK}
				{if $userProfile->getUserTitle()}
					<div class="userTitle">
						<p class="badge userTitleBadge{if $userProfile->getRank() && $userProfile->getRank()->cssClassName} {@$userProfile->getRank()->cssClassName}{/if}">{$userProfile->getUserTitle()}</p>
					</div>
				{/if}
				{if $userProfile->getRank() && $userProfile->getRank()->rankImage}
					<div class="userRank">{@$userProfile->getRank()->getImage()}</div>
				{/if}
			{/if}
		{else}
			<header>
				<h1 class="username">
					<span>{@$userProfile->username}</span>
				</h1>
				
				<div class="userTitle">
					<p class="badge">{lang}wcf.user.guest{/lang}</p>
				</div>
			</header>
		{/if}
		
		{if $userProfile->userID}
			{hascontent}
				<div class="userCredits">
					<dl class="plain dataList">
						{content}
							{if MESSAGE_SIDEBAR_ENABLE_LIKES_RECEIVED && $userProfile->likesReceived}
								<dt>{lang}wcf.like.likesReceived{/lang}</dt>
								<dd>{#$userProfile->likesReceived}</dd>
							{/if}
							
							{if MESSAGE_SIDEBAR_ENABLE_ACTIVITY_POINTS && $userProfile->activityPoints}
								<dt><a class="activityPointsDisplay jsTooltip" title="{lang}wcf.user.activityPoint.showDetails{/lang}" data-user-id="{@$userProfile->userID}">{lang}wcf.user.activityPoint{/lang}</a></dt>
								<dd>{#$userProfile->activityPoints}</dd>
							{/if}
							{event name='userCredits'}
							{if MESSAGE_SIDEBAR_USER_OPTIONS}
								{assign var='__sidebarUserOptions' value=','|explode:MESSAGE_SIDEBAR_USER_OPTIONS}
								{foreach from=$__sidebarUserOptions item='__sidebarUserOption'}
									{if $userProfile->getUserOption($__sidebarUserOption)}
										<dt>{lang}wcf.user.option.{$__sidebarUserOption}{/lang}</dt>
										<dd>{$userProfile->getUserOption($__sidebarUserOption)}</dd>
									{/if}
								{/foreach}
							{/if}
						{/content}
					</dl>
				</div>
			{/hascontent}
		{/if}
	</div>
</aside>
