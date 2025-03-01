<!-- start login.tpl -->
<div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
	<table width="50%" cellpadding="2">
		<tr class="table_head">
			<td>&nbsp;</td>
		</tr>
		<tr class="table_list">
			<td>
				<form name="loginform" action="login.php" method="post">
				<table width='20%'>
					<tr>
						<td class="enter text-sm text-gray-600 dark:text-gray-400">
							{"_USERNAME"|lang}:
						</td>
						<td class='enter'>
							<input type="text" name="user">
						</td>
						<td>
							<input type='checkbox' checked="checked" name='remember' class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"></input>
							<span class="text-sm text-gray-600 dark:text-gray-400">{"_REMEMBERME"|lang}</span>
						</td>
					</tr>
					<tr>
						<td class="enter text-sm text-gray-600 dark:text-gray-400">
							{"_PASSWORD"|lang}:
						</td>
						<td class='enter'>
							<input type="password" name="pass">
						</td>
						<td>
							<button type="submit" name="action" id="action2" value="Login" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
								{"_LOGIN"|lang}
							</button>
						</td>
					</tr>
					{if $msg}<span class='errored'>{$msg|lang}</span><br>{/if}
					{if $try}<span class='errored'>{"_LOGINTRY"|lang} {$try}/3</span><br>{/if}
					{if $block_left}<span class='errored'>{$block_left|date2word:true} {"_REMAINING"|lang}</span><br>{/if}
				</table>
				</form>
			</td>
		</tr>
	</table>
</div>
<!-- end login.tpl -->