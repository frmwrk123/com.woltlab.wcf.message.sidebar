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
						
						{if MESSAGE_SIDEBAR_ENABLE_ONLINE_STATUS && $userProfile->isOnline()}<span class="badge badgeGreen badgeOnline" title="{lang}wcf.user.online.title{/lang}">{lang}wcf.user.online{/lang}</span>{/if}
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
					<dl class="dataList">
						{content}
							{if MESSAGE_SIDEBAR_ENABLE_LIKES_RECEIVED}
								<dt>{lang}wcf.like.likesReceived{/lang}</dt>
								<dd>{#$userProfile->likesReceived}</dd>
							{/if}
							
							{event name='userCredits'}
						{/content}
					</dl>
				</div>
			{/hascontent}
		{/if}
	</div>
</aside>
