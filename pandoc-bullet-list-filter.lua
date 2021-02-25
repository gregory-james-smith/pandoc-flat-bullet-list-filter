

-- div
-- list

-- \textbullet

function Div(elem)
    local classes = elem.classes
    if is_bullet_list_div(classes) then
        local content = elem.content[1]
        if content.tag == "BulletList" then
            local text = {}
            local bullets = content.content
            for i,j in ipairs(bullets) do
                local section = j[1]
                if i~= 1 then
                    local bullet = pandoc.RawInline("latex", "\\enspace $\\bullet$ \\enspace")
                    local space = pandoc.Space()
                    table.insert(text, space)
                    table.insert(text, bullet)
                    table.insert(text, space)
                end
                table.insert(text, pandoc.Str(pandoc.utils.stringify(section)))
            end
            local paragraph = pandoc.Para(text)
            return pandoc.Div({paragraph}, {class = "bullet-list"})
        end
    end
    return elem
end

-- Div
-- list of blocks (para)
-- Para
-- list on inlines (str and rawline)

-- {
--     "t": "Div",
--     "c": [
--         [
--             "",
--             [
--                 "bullet-list"
--             ],
--             []
--         ],
--         [
--             {
--                 "t": "BulletList",
--                 "c": [
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "One"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Two"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Three"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Four"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Five"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Six"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Seven"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Eight"
--                                 }
--                             ]
--                         }
--                     ],
--                     [
--                         {
--                             "t": "Plain",
--                             "c": [
--                                 {
--                                     "t": "Str",
--                                     "c": "Nine"
--                                 }
--                             ]
--                         }
--                     ]
--                 ]
--             }
--         ]
--     ]
-- }

function is_bullet_list_div(classes)
    for _,i in pairs(classes) do
        if i == "bullet-list" then
            return true
        end
    end
    return false
end