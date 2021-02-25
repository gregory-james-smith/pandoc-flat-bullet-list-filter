
-- Constants

-- Name of the div class which indicates it should be a flat bullet list
local class_name = "bullet-list"

local bullet = pandoc.RawInline("latex", "\\enspace $\\bullet$ \\enspace")
local space = pandoc.Space()

function Div(elem)
    local bullets = get_bullet_list_div_contents(elem)
    if bullets then
        local text = {}
        for i,j in ipairs(bullets) do
            local section = j[1]
            if i~= 1 then
                table.insert(text, space)
                table.insert(text, bullet)
                table.insert(text, space)
            end
            table.insert(text, pandoc.Str(pandoc.utils.stringify(section)))
        end
        local paragraph = pandoc.Para(text)
        return pandoc.Div({paragraph}, {class = class_name})
    end
    return elem
end

-- Returns the contents of BulletList inside Div with configured class tag, otherwise returns nil
function get_bullet_list_div_contents(elem)
    if is_bullet_list_class(elem) then
        local content = elem.content[1]
        if content.tag == "BulletList" then
            return content.content
        end
    end
    return nil
end

-- Return true iff div has the configured class tag
function is_bullet_list_class(elem)
    local classes = elem.classes
    for _,i in pairs(classes) do
        if i == class_name then
            return true
        end
    end
    return false
end
