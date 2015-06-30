require 'uio/BaseElement'

UIO.Titlebar = {};

function UIO.Titlebar.new(x, y, w, h)
	local self = UIO.BaseElement.new(x, y, w, h);

	local titleBarBackground = getTexture("media/ui/Panel_TitleBar.png");
	local textColor = {r = 1, g = 1, b = 1, a = 1};
	local collapsible = false;
	local isCollapsed = false;
	local title = "Window";
	
	function self:setTitle(t)
		title = t;
	end
	function self:prerender()
		self:drawRectangle("fill", self:getX(), self:getY(), self:getWidth(), self:getHeight(), self:getBackgroundColor());
		self:drawTextureScaled(titleBarBackground, self:getX()+1, self:getY()+1, self:getWidth() - 1, self:getHeight() - 2);
		self:drawRectangle("line", self:getX(), self:getY(), self:getWidth(), self:getHeight(), self:getBorderColor());

		self:drawTextCentered(title, self:getWidth() / 2, self:getY()+1, textColor);
	end

	self:setBackgroundColorRGBA(0, 0, 0, 0.8);
	self:setBorderColorRGBA(0.4, 0.4, 0.4, 1);
	return self;
end
