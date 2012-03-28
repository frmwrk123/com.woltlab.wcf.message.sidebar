<aside class="messageSidebar">
	<div>
		{if $sidebar->getUserProfile()->userID}
			{assign var='username' value=$sidebar->getUserProfile()->username}
			
			<header>
				<h1 class="username">
					<a href="{link controller='User' object=$sidebar->getUserProfile()->getDecoratedObject()}{/link}" title="{lang}wcf.user.viewProfile{/lang}">
						{if MESSAGE_SIDEBAR_ENABLE_ONLINE_STATUS}
							{if $sidebar->getUserProfile()->isOnline()}
								<img src="{icon}online{/icon}" class="icon16" alt="" title="{lang}wcf.user.online{/lang}" />
							{else}
								<img src="{icon}offline{/icon}" class="icon16" alt="" title="{lang}wcf.user.offline{/lang}" />		
							{/if}
						{/if}
						<span>{@$sidebar->getStyledUsername()}</span>
					</a>
				</h1>
				
				{if MODULE_USER_RANK && MESSAGE_SIDEBAR_ENABLE_RANK}
					{if $sidebar->getUserProfile()->getUserTitle()}
						<div class="userTitle">
							<p class="badge">{$sidebar->getUserProfile()->getUserTitle()|language}</p>
						</div>
					{/if}
					{if $sidebar->getUserProfile()->getRank() && $sidebar->getUserProfile()->getRank()->rankImage}
						<div class="userRank">{@$sidebar->getUserProfile()->getRank()->getImage()}</p>
					{/if}
				{/if}
			</header>
			
			{if MESSAGE_SIDEBAR_ENABLE_AVATAR}
				{if $sidebar->getUserProfile()->getAvatar()}
					<div class="userAvatar">
						<a href="{link controller='User' object=$sidebar->getUserProfile()->getDecoratedObject()}{/link}" title="{lang}wcf.user.viewProfile{/lang}">{@$sidebar->getUserProfile()->getAvatar()->getImageTag()}</a>
					</div>
				{/if}
			{/if}
		{else}
			<header>
				<h1 class="username">
					<span>{@$sidebar->getStyledUsername()}</span>
				</h1>
				
				<div class="userTitle">
					<p class="badge">{lang}wcf.user.guest{/lang}</p>
				</div>
			</header>
		{/if}
			
		{if $sidebar->getUserStatus()|count}
			<div class="userStatus">
				<ul>
					{foreach from=$sidebar->getUserStatus() item=$userStatus}
						<li{if $userStatus[class]} class="{@$userStatus[class]}"{/if}>{@$userStatus[value]}</li>
					{/foreach}
				</ul>
			</div>
		{/if}
		
		{if $sidebar->getUserProfile()->userID}	
			{if $sidebar->getUserCredits()|count}
				<div class="userCredits">
					<dl>
						{foreach from=$sidebar->getUserCredits() item=$userCredit}
							<dt{if $userCredit[class]} class="{@$userCredit[class]}"{/if}>{if $userCredit[url]}<a href="{@$userCredit[url]}">{@$userCredit[name]}:</a>{else}{@$userCredit[name]}:{/if}</dt>
							<dd{if $userCredit[class]} class="{@$userCredit[class]}"{/if}>{if $userCredit[url]}<a href="{@$userCredit[url]}">{@$userCredit[value]}</a>{else}{@$userCredit[value]}{/if}</dd>
						{/foreach}
					</dl>
				</div>
			{/if}
		{/if}
			
		{if $sidebar->getUserContacts()|count}
			<div class="userContacts">
				<ul>
					{foreach from=$sidebar->getUserContacts() item=$userContact}
						<li{if $userContact[class]} class="{@$userContact[class]}"{/if}>{@$userContact[value]}</li>
					{/foreach}
				</ul>
			</div>
		{/if}
	</div>
</aside>
