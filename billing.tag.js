riot.tag2('x-billing', '<strong>{opts.listing.name}</strong> <hr> <div> <span>{opts.cards.length} cards</span> <span>{opts.total.hour} hours</span> <span>¥{opts.total.yen}</span> <span>${opts.total.dollar}</span> </div> <table> <tr each="{card in opts.cards}"> <td>{card.shortLink}</td> <td>{card.name}</td> <td>{card.due}</td> <td>{card.hour}</td> <td>{card.dateLastActivity.substr(0,10)}</td> </tr> </table>', 'x-billing span,[data-is="x-billing"] span{ margin: 0 3em; } x-billing table,[data-is="x-billing"] table{ width: 100% }', '', function(opts) {
});