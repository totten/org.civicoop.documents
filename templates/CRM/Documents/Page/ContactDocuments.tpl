{if $permission EQ 'edit'}
    {capture assign=newDocumentURL}{crmURL p="civicrm/documents/add" q="reset=1&action=add&cid=`$contactId`"}{/capture}
    <div class="action-link">
        <a accesskey="N" href="{$newDocumentURL}" class="button">
            <span><div class="icon add-icon"></div>{ts}New document{/ts}</span>
        </a>
    </div>

{/if}
<table>
    <thead>
        <tr>
            <th class="ui-state-default">{ts}Subject{/ts}</th>
            <th class="ui-state-default">{ts}Date added{/ts}</th>
            <th class="ui-state-default">{ts}Added by{/ts}</th>
            <th class="ui-state-default">{ts}Date updated{/ts}</th>
            <th class="ui-state-default">{ts}Updated by{/ts}</th>
            <th class="no-sort ui-state-default"></th>
        </tr>
     </thead>
     <tbody>
        
        {foreach from=$documents item=doc}
            {capture assign="docId"}{$doc->getId()}{/capture}
            {capture assign=delDocumentURL}{crmURL p="civicrm/documents/add" q="reset=1&action=delete&cid=`$contactId`&id=`$docId`"}{/capture}

            <tr class="{cycle values="odd,even"}">
                <td>{$doc->getSubject()}</td>
                <td>{$doc->getFormattedDateAdded()}</td>
                <td>{$doc->getFormattedAddedBy()}</td>
                <td>{$doc->getFormattedDateUpdated()}</td>
                <td>{$doc->getFormattedUpdatedBy()}</td>
                <td>
                    <span>
                    <a href="#" class="action-item action-item-first">{ts}Download{/ts}</a>
                    <a href="#" class="action-item">{ts}Upload new version{/ts}</a>
                    <a href="{$delDocumentURL}" class="action-item">{ts}Delete{/ts}</a>
                    </span>
                </td>
            </tr>
        {/foreach}
    </tbody>
</table>