on_error = (error) ->
    console.log error

HOUR_R = /([\.\d]+)h$/
YEN_R = /¥(\d+)$/
DOLLAR_R = /\u0024(\d+)$/

get_num = (regex, target) ->
    ret = regex.exec(target)
    if ret isnt null
        return parseFloat(ret[1])
    else
        return 0

transform_card = (card, total) ->
    card.hour = get_num HOUR_R, card.name
    card.yen = get_num YEN_R, card.name
    card.dollar = get_num DOLLAR_R, card.name
    
    total.hour += card.hour
    total.yen += card.yen
    total.dollar += card.dollar

class App

    start: ->
        Trello.get '/members/me/boards', (boards) =>
            for _board in boards
                continue if _board.closed
                ( =>
                    board = $.extend {}, _board

                    Trello.get("/boards/#{board.id}/lists").then (lists) =>
                        element = document.createElement 'x-board'
                        $('#boards').append(element)
                        riot.mount element, 'x-board',
                            board: board,
                            lists: lists
                            getCards: @getCards
                )()


    getCards: (e) ->
        listing = e.item.listing
        Trello.get("/lists/#{listing.id}/cards").then (cards) ->
            element = document.createElement 'x-billing'
            $('#cards').html('')
            $('#cards').append(element)
            total =
                yen: 0
                dollar: 0
                hour: 0
            for card in cards
                transform_card(card, total)
            riot.mount element, 'x-billing',
                cards: cards
                listing: listing
                total: total
    
            
window.TrelloBilling = App