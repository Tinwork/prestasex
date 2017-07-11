{extends file='layouts/layout-both-columns.tpl'}

{block name='header'}
    {include file='_partials/header.tpl'}
{/block}

{block name='left_column'}{/block}
{block name='right_column'}{/block}

{block name='content_wrapper'}
  <div id="content-wrapper">
    {block name='content'}
      <p>Hello world! This is HTML5 Boilerplate.</p>
    {/block}
  </div>
{/block}
