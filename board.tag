<x-board>

<strong>{ opts.board.name }</strong>

<div each={ listing in opts.lists }>
    <div title={ listing.shortLink }
        onclick={ opts.getCards }>

        { listing.name }
    </div>
</div>

</x-board>