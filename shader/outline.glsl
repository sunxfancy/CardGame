vec4 resultCol;

vec4 effect( vec4 col, Image texture, vec2 texturePos, vec2 screenPos )
{
	number pwidth = 0.005;
	number pheight = 0.005;
	number alpha = 4*texture2D( texture, texturePos ).a;
    alpha -= texture2D( texture, texturePos + vec2( pwidth, 0.0f ) ).a;
    alpha -= texture2D( texture, texturePos + vec2( -pwidth, 0.0f ) ).a;
    alpha -= texture2D( texture, texturePos + vec2( 0.0f, pheight ) ).a;
    alpha -= texture2D( texture, texturePos + vec2( 0.0f, -pheight ) ).a;
	// calculate resulting color
    resultCol = vec4( 0.0f, 0.0f, 0.0f, alpha );
    // return color for current pixel
    return resultCol;
}
