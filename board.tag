<x-board>
<br>
<strong>{ opts.board.name }</strong>
<hr>
<div each={ listing in opts.lists }>
    <div title={ listing.shortLink }
        onclick={ opts.getCards }>

        { listing.name }
    </div>
</div>
<style> hr { margin: 0; }</style>
</x-board>