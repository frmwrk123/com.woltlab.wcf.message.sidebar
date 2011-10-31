<aside class="messageSidebar">
	<div>
		{if $sidebar->getUserProfile()->userID}
			{assign var='username' value=$sidebar->getUserProfile()->username}
			
			<header>
				<h1 class="userName">
					{if MESSAGE_SIDEBAR_ENABLE_ONLINE_STATUS}
						{if $sidebar->getUserProfile()->isOnline()}
							<img src="{icon}online{/icon}" alt="" title="{lang}wcf.user.online{/lang}" />
						{else}
							<img src="{icon}offline{/icon}" alt="" title="{lang}wcf.user.offline{/lang}" />		
						{/if}
					{/if}
					
					<a href="{link controller='User' id=$sidebar->getUserProfile()->userID}{/link}" title="{lang}wcf.user.viewProfile{/lang}"><span>{@$sidebar->getStyledUsername()}</span></a>
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
						<a href="{link controller='User' id=$sidebar->getUserProfile()->userID}{/link}" title="{lang}wcf.user.viewProfile{/lang}">{@$sidebar->getUserProfile()->getAvatar()}</a>
					</div>
				{/if}
			{/if}
			
			{if $sidebar->getUserSymbols()|count}
				<div class="userSymbols">
					<ul>
						{foreach from=$sidebar->getUserSymbols() item=$userSymbol}
							<li>{@$userSymbol[value]}</li>
						{/foreach}
					</ul>
				</div>
			{/if}
			
			{if $sidebar->getUserCredits()|count}
				<div class="userCredits">
					{foreach from=$sidebar->getUserCredits() item=$userCredit}
						<p>{if $userCredit[url]}<a href="{@$userCredit[url]}">{@$userCredit[name]}: {@$userCredit[value]}</a>{else}{@$userCredit[name]}: {@$userCredit[value]}{/if}</p>
					{/foreach}
				</div>
			{/if}
			
			{if $sidebar->getUserContacts()|count}
				<div class="userMessenger">
					<ul>
						{foreach from=$sidebar->getUserContacts() item=$userContact}
							<li>{@$userContact[value]}</li>
						{/foreach}
					</ul>
				</div>
			{/if}
		{else}
			<header>
				<h1 class="userName">
					<span>{@$sidebar->getStyledUsername()}</span>
				</h1>
				
				<div class="userTitle">
					<p class="badge">{lang}wcf.user.guest{/lang}</p>
				</div>
			</header>
		
			{if $sidebar->getUserSymbols()|count}
				<div class="userSymbols">
					<ul>
						{foreach from=$sidebar->getUserSymbols() item=$userSymbol}
							<li>{@$userSymbol[value]}</li>
						{/foreach}
					</ul>
				</div>
			{/if}
			
			{if $sidebar->getUserContacts()|count}
				<div class="userMessenger">
					<ul>
						{foreach from=$sidebar->getUserContacts() item=$userContact}
							<li>{@$userContact[value]}</li>
						{/foreach}
					</ul>
				</div>
			{/if}
		{/if}
	</div>
</aside>
