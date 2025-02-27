<div class="main">

	<div class="post">

<!-- Pagenation -->
<!--
    <div class="pager" style="text-align:right">
        <span class="first">{"_SITE"|lang} {$ban_page.current} {"_OF"|lang} {$ban_page.max_page}:</span>
        {if $pagenav.first}
            <a href="?site={$pagenav.first}"><img src="images/page_start.png" title="{"_FIRST_PAGE"|lang}" alt="{"_FIRST_PAGE"|lang}"></a>
        {/if}
        {if $pagenav.prev}
            <a href="?site={$pagenav.prev}"><img src="images/page_back.png" title="{"_PREVIOUS_PAGE"|lang}" alt="{"_PREVIOUS_PAGE"|lang}"></a>
        {/if}
        {foreach from=$pagenav.pages item=page}
            {if $page.current}
                <span>{$page.number}</span>
            {else}
                <a href="?site={$page.number}">{$page.number}</a>
            {/if}
        {/foreach}
        {if $pagenav.next}
            <a href="?site={$pagenav.next}"><img src="images/page_next.png" title="{"_NEXT_PAGE"|lang}" alt="{"_NEXT_PAGE"|lang}"></a>
        {/if}
        {if $pagenav.last}
            <a href="?site={$pagenav.last}"><img src="images/page_end.png" title="{"_LAST_PAGE"|lang}" alt="{"_LAST_PAGE"|lang}"></a>
        {/if}
    </div>
    <br /><br />
-->
<!-- Pagination --> 

		<table frame="box" rules="groups" summary="" class="w-full whitespace-no-wrap">
				<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
					<th class="px-4 py-3">&nbsp;</th>
					<th class="_center px-4 py-3">{"_DATE"|lang}</th>
					<th class="_center px-4 py-3">{"_PLAYER"|lang}</th>
					<th class="_center px-4 py-3">{"_ADMIN"|lang}</th>
					<th class="_center px-4 py-3">{"_REASON"|lang}</th>
					<th class="_center px-4 py-3">{"_LENGHT"|lang}</th>
					{if $ban_page.show_comments == 1 && $vars.use_comment == 1}<th class="px-4 py-3" style="width: 30px;">{"_BL_COMMENTS"|lang}</th>{/if}
					{if $ban_page.show_demos == 1 && $vars.use_demo == 1}<th class="px-4 py-3" style="width: 30px;">{"_BL_FILES"|lang}</th>{/if}
					{if $ban_page.show_kicks == 1}<th class="px-4 py-3" style="width: 30px;">{"_BL_KICKS"|lang}</th>{/if}
				</tr>

			<tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">

				{if $error}
				<!-- No Bans -->
					<tr>
						<td class="_center" colspan="9">{"_NO_BANS"|lang}</td>
					</tr>
				<!-- No Bans -->
				{else}
	
				<!-- Banlist -->

					{foreach from=$ban_list item=ban_entry}

						{if $ban_entry.ban_length>0 && $ban_entry.ban_end < $smarty.now}
							<tr onclick="NewToggleLayer('layer_{$ban_entry.bid}')" style="cursor: pointer;" class="text-gray-700 dark:text-gray-400">
						{else}
							<tr onclick="NewToggleLayer('layer_{$ban_entry.bid}')" style="cursor: pointer;" class="text-gray-700 dark:text-gray-400">
						{/if}

						<td class="px-4 py-3 text-sm"><img alt="{if $ban_entry.mod == "html"}{"_WEB"|lang}{else}{$ban_entry.mod|lang}{/if}" title="{if $ban_entry.mod == "html"}{"_WEB"|lang}{else}{$ban_entry.mod|lang}{/if}" src="templates/{$design}_gfx/games/{$ban_entry.mod}.gif" /></td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.ban_created|date_format:"%Y-%m-%d"}</td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.player_nick}</td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.admin_nick}</td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.ban_reason}</td>
						<td class="_center px-4 py-3 text-sm">{if $ban_entry.ban_length>0}
								{($ban_entry.ban_length*60)|date2word:true}
							{else}
								{"_PERMANENT"|lang}
							{/if}
						</td>

						{if $ban_page.show_comments == 1 && $vars.use_comment == 1}<td class="_center">{$ban_entry.comment_count}</td>{/if}
						{if $ban_page.show_demos == 1 && $vars.use_demo == 1}<td class="_center">{$ban_entry.demo_count}</td>{/if}
						{if $ban_page.show_kicks == 1}<td class="_center">{$ban_entry.kick_count}</td>{/if}

					</tr>

					<tr id="layer_{$ban_entry.bid}" style="display:none;">
						<td class="server-info" colspan="9"><div style="display:none;">
							<table frame="box" rules="groups" summary="">
								<thead>
									<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
										<th style="width:150px;">{"_BANDETAILS"|lang}</th>
										<th class="_right">

											<form method="post" action="" style="display:inline;">
												<input type="hidden" name="bid" value="{$ban_entry.bid}" />
												<input type="hidden" name="site" value="{$ban_page.current}" />
												<input class="img_input" name="details" type="image" src="templates/{$design}_gfx/page.png" title="{"_DETAILS"|lang}"/>
											</form>
											{if $smarty.session.bans_delete=="yes" || ($smarty.session.bans_delete=="own" && $smarty.session.uname == $ban_detail.username)}

											<form method="post" action="" style="display:inline;">
												<input class="img_input" name="del_ban" type="image" src="templates/{$design}_gfx/page_delete.png" onclick="return confirm('{"_DELBAN"|lang}{"_DATALOSS"|lang}');" border="0" title="{"_TIP_DEL"|lang}" />
												<input type="hidden" name="bid" value="{$ban_entry.bid}" />
												<input type="hidden" name="details_x" value="1" />
											</form>
											{/if}

										</th>
									</tr>
								</thead>
								<tbody>

									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_NICKNAME"|lang}</td>
										<td>{$ban_entry.player_nick}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_STEAMID"|lang}</td>
										<td>{if $ban_entry.player_id <> ""}{$ban_entry.player_id}{else}<span style='font-style:italic;font-weight:bold;'>{"_NOSTEAMID"|lang}</span>{/if}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_STEAMCOMID"|lang}</td>
										<td>
											{if $ban_entry.player_id <> ""}
												<a target="_blank" href="http://steamcommunity.com/profiles/{$ban_entry.player_comid}">{$ban_entry.player_comid}</a>
											{else}
												{"_NOTAVAILABLE"|lang}
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_IP"|lang}</td>
										<td>
											{if $smarty.session.ip_view=="yes"}
												{if $ban_entry.player_ip}
													{$ban_entry.player_ip}
												{else}
													<i>{"_NOTAVAILABLE"|lang}</i>
												{/if}
											{else}
												<span style='font-style:italic;font-weight:bold'>{"_HIDDEN"|lang}</span>
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_BANTYPE"|lang}</td>
										<td>
											{if $ban_entry.ban_type=="S"}
												{"_STEAMID"|lang}
											{elseif $ban_entry.ban_type=="SI"}
												{"_STEAMID&IP"|lang}
											{else}
												{"_NOTAVAILABLE"|lang}
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_REASON"|lang}</td>
										<td>{$ban_entry.ban_reason}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_INVOKED"|lang}</td>
										<td>{$ban_entry.ban_created|date_format:"%d %b %Y - %T"}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_EXPIRES"|lang}</td>
										<td>
											{if $ban_entry.ban_length==0}
												<span style='font-style:italic;font-weight:bold;color:red'>{"_NOTAPPLICABLE"|lang}</span>
											{else}
												{$ban_entry.ban_end|date_format:"%d %b %Y - %T"}
												{if $ban_entry.ban_end < $smarty.now}
													({"_ALREADYEXP"|lang})
												{else}
													<i>({($ban_entry.ban_end-$smarty.now)|date2word} {"_REMAINING"|lang})</i>
												{/if}
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_BANBY"|lang}</td>
										<td>{$ban_entry.admin_nick}{if $ban_entry.nickname}<i>({$ban_entry.nickname})</i>{/if}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_BANON"|lang}</td>
										<td>{if $ban_entry.server_name == "website"}{"_WEB"|lang}{else}{$ban_entry.server_name}{/if}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_TOTALEXPBANS"|lang}</td>
										<td>{$ban_entry.bancount-1}</td>
									</tr>
								</tbody>
							</table> </div>
						</td>
					</tr>
					{/foreach}
				{/if}
				<!-- Banlist -->


				<tr class="text-gray-700 dark:text-gray-400">
					<td colspan="9" class="px-4 py-3">
						<!-- Pagenation -->
						<div class="pager" style="text-align:right">
							<span class="first text-xs text-gray-600 dark:text-gray-400">{"_SITE"|lang} {$ban_page.current} {"_OF"|lang} {$ban_page.max_page}:</span>
							{if $pagenav.first}
								<a href="?site={$pagenav.first}"><img src="images/page_start.png" title="{"_FIRST_PAGE"|lang}" alt="{"_FIRST_PAGE"|lang}"></a>
							{/if}
							{if $pagenav.prev}
								<a href="?site={$pagenav.prev}"><img src="images/page_back.png" title="{"_PREVIOUS_PAGE"|lang}" alt="{"_PREVIOUS_PAGE"|lang}"></a>
							{/if}
							{foreach from=$pagenav.pages item=page}
								{if $page.current}
									<span class="text-xs text-gray-600 dark:text-gray-400">{$page.number}</span>
								{else}
									<a href="?site={$page.number}">{$page.number}</a>
								{/if}
							{/foreach}
							{if $pagenav.next}
								<a href="?site={$pagenav.next}"><img src="images/page_next.png" title="{"_NEXT_PAGE"|lang}" alt="{"_NEXT_PAGE"|lang}"></a>
							{/if}
							{if $pagenav.last}
								<a href="?site={$pagenav.last}"><img src="images/page_end.png" title="{"_LAST_PAGE"|lang}" alt="{"_LAST_PAGE"|lang}"></a>
							{/if}
						</div>
						<!-- Pagenation -->
					</td>
				</tr>




			</tbody>
		</table>

		<div class="clearer">&nbsp;</div>

	</div>

	<div class="clearer">&nbsp;</div>

<!-- Pagenation -->
<!--
    <div class="pager" style="text-align:right">

        <span class="first text-xs text-gray-600 dark:text-gray-400">{"_SITE"|lang} {$ban_page.current} {"_OF"|lang} {$ban_page.max_page}:</span>
        {if $pagenav.first}
            <a href="?site={$pagenav.first}"><img src="images/page_start.png" title="{"_FIRST_PAGE"|lang}" alt="{"_FIRST_PAGE"|lang}"></a>
        {/if}
        {if $pagenav.prev}
            <a href="?site={$pagenav.prev}"><img src="images/page_back.png" title="{"_PREVIOUS_PAGE"|lang}" alt="{"_PREVIOUS_PAGE"|lang}"></a>
        {/if}
        {foreach from=$pagenav.pages item=page}
            {if $page.current}
                <span class="text-xs text-gray-600 dark:text-gray-400">{$page.number}</span>
            {else}
                <a href="?site={$page.number}">{$page.number}</a>
            {/if}
        {/foreach}
        {if $pagenav.next}
            <a href="?site={$pagenav.next}"><img src="images/page_next.png" title="{"_NEXT_PAGE"|lang}" alt="{"_NEXT_PAGE"|lang}"></a>
        {/if}
        {if $pagenav.last}
            <a href="?site={$pagenav.last}"><img src="images/page_end.png" title="{"_LAST_PAGE"|lang}" alt="{"_LAST_PAGE"|lang}"></a>
        {/if}
    </div>
    <div class="clearer"></div>
-->
	<!-- Pagenation -->  

</div>

