
-- Constants

-- Name of the div class which indicates it should be a flat bullet list
local class_name = "bullet-list"

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
            return pandoc.Div({paragraph}, {class = class_name})
        end
    end
    return elem
end

function is_bullet_list_div(classes)
    for _,i in pairs(classes) do
        if i == class_name then
            return true
        end
    end
    return false
end
