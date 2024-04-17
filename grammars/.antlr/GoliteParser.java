// Generated from /Users/oliviajerdee/College/Year4/compilers/proj-optimization-overlords/grammars/GoliteParser.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue"})
public class GoliteParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		PLUS=1, MINUS=2, EQUALS=3, ASTERISK=4, FSLASH=5, SEMICOLON=6, INT=7, BOOL=8, 
		VAR=9, FUNC=10, DELETE=11, SCAN=12, PRINTF=13, IF=14, ELSE=15, FOR=16, 
		RETURN=17, OR=18, AND=19, EQ=20, NEQ=21, LT=22, GT=23, LTE=24, GTE=25, 
		NOT=26, DOT=27, NEW=28, TRUE=29, FALSE=30, LBRACE=31, RBRACE=32, LPAREN=33, 
		RPAREN=34, COMMA=35, INTLIT=36, STRINGLIT=37, WS=38, STRUCT=39, NIL=40, 
		TYPEKEY=41, ID=42, COMMENT=43;
	public static final int
		RULE_program = 0, RULE_typeDeclaration = 1, RULE_decl = 2, RULE_type = 3, 
		RULE_declaration = 4, RULE_function = 5, RULE_returnType = 6, RULE_statement = 7, 
		RULE_block = 8, RULE_delete = 9, RULE_read = 10, RULE_assignment = 11, 
		RULE_print = 12, RULE_conditional = 13, RULE_loop = 14, RULE_return = 15, 
		RULE_invocation = 16, RULE_lValue = 17, RULE_expression = 18, RULE_boolTerm = 19, 
		RULE_equalTerm = 20, RULE_eqNeq = 21, RULE_relationTerm = 22, RULE_greaterLess = 23, 
		RULE_simpleTerm = 24, RULE_plusMinus = 25, RULE_term = 26, RULE_asteriskFSlash = 27, 
		RULE_unaryTerm = 28, RULE_selectorTerm = 29, RULE_factor = 30;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "typeDeclaration", "decl", "type", "declaration", "function", 
			"returnType", "statement", "block", "delete", "read", "assignment", "print", 
			"conditional", "loop", "return", "invocation", "lValue", "expression", 
			"boolTerm", "equalTerm", "eqNeq", "relationTerm", "greaterLess", "simpleTerm", 
			"plusMinus", "term", "asteriskFSlash", "unaryTerm", "selectorTerm", "factor"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'+'", "'-'", "'='", "'*'", "'/'", "';'", "'int'", "'bool'", "'var'", 
			"'func'", "'delete'", "'scan'", "'printf'", "'if'", "'else'", "'for'", 
			"'return'", "'||'", "'&&'", "'=='", "'!='", "'<'", "'>'", "'<='", "'>='", 
			"'!'", "'.'", "'new'", "'true'", "'false'", "'{'", "'}'", "'('", "')'", 
			"','", null, null, null, "'struct'", "'nil'", "'type'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "PLUS", "MINUS", "EQUALS", "ASTERISK", "FSLASH", "SEMICOLON", "INT", 
			"BOOL", "VAR", "FUNC", "DELETE", "SCAN", "PRINTF", "IF", "ELSE", "FOR", 
			"RETURN", "OR", "AND", "EQ", "NEQ", "LT", "GT", "LTE", "GTE", "NOT", 
			"DOT", "NEW", "TRUE", "FALSE", "LBRACE", "RBRACE", "LPAREN", "RPAREN", 
			"COMMA", "INTLIT", "STRINGLIT", "WS", "STRUCT", "NIL", "TYPEKEY", "ID", 
			"COMMENT"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "GoliteParser.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public GoliteParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(GoliteParser.EOF, 0); }
		public List<TypeDeclarationContext> typeDeclaration() {
			return getRuleContexts(TypeDeclarationContext.class);
		}
		public TypeDeclarationContext typeDeclaration(int i) {
			return getRuleContext(TypeDeclarationContext.class,i);
		}
		public List<DeclarationContext> declaration() {
			return getRuleContexts(DeclarationContext.class);
		}
		public DeclarationContext declaration(int i) {
			return getRuleContext(DeclarationContext.class,i);
		}
		public List<FunctionContext> function() {
			return getRuleContexts(FunctionContext.class);
		}
		public FunctionContext function(int i) {
			return getRuleContext(FunctionContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(65);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==TYPEKEY) {
				{
				{
				setState(62);
				typeDeclaration();
				}
				}
				setState(67);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(71);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==VAR) {
				{
				{
				setState(68);
				declaration();
				}
				}
				setState(73);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(77);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==FUNC) {
				{
				{
				setState(74);
				function();
				}
				}
				setState(79);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(80);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class TypeDeclarationContext extends ParserRuleContext {
		public TerminalNode TYPEKEY() { return getToken(GoliteParser.TYPEKEY, 0); }
		public TerminalNode ID() { return getToken(GoliteParser.ID, 0); }
		public TerminalNode STRUCT() { return getToken(GoliteParser.STRUCT, 0); }
		public TerminalNode LBRACE() { return getToken(GoliteParser.LBRACE, 0); }
		public List<DeclContext> decl() {
			return getRuleContexts(DeclContext.class);
		}
		public DeclContext decl(int i) {
			return getRuleContext(DeclContext.class,i);
		}
		public List<TerminalNode> SEMICOLON() { return getTokens(GoliteParser.SEMICOLON); }
		public TerminalNode SEMICOLON(int i) {
			return getToken(GoliteParser.SEMICOLON, i);
		}
		public TerminalNode RBRACE() { return getToken(GoliteParser.RBRACE, 0); }
		public TypeDeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_typeDeclaration; }
	}

	public final TypeDeclarationContext typeDeclaration() throws RecognitionException {
		TypeDeclarationContext _localctx = new TypeDeclarationContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_typeDeclaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(82);
			match(TYPEKEY);
			setState(83);
			match(ID);
			setState(84);
			match(STRUCT);
			setState(85);
			match(LBRACE);
			setState(86);
			decl();
			setState(87);
			match(SEMICOLON);
			setState(93);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==ID) {
				{
				{
				setState(88);
				decl();
				setState(89);
				match(SEMICOLON);
				}
				}
				setState(95);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(96);
			match(RBRACE);
			setState(97);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class DeclContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoliteParser.ID, 0); }
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public DeclContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_decl; }
	}

	public final DeclContext decl() throws RecognitionException {
		DeclContext _localctx = new DeclContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_decl);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(99);
			match(ID);
			setState(100);
			type();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class TypeContext extends ParserRuleContext {
		public TerminalNode INT() { return getToken(GoliteParser.INT, 0); }
		public TerminalNode BOOL() { return getToken(GoliteParser.BOOL, 0); }
		public TerminalNode ASTERISK() { return getToken(GoliteParser.ASTERISK, 0); }
		public TerminalNode ID() { return getToken(GoliteParser.ID, 0); }
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
	}

	public final TypeContext type() throws RecognitionException {
		TypeContext _localctx = new TypeContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_type);
		try {
			setState(106);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
				enterOuterAlt(_localctx, 1);
				{
				setState(102);
				match(INT);
				}
				break;
			case BOOL:
				enterOuterAlt(_localctx, 2);
				{
				setState(103);
				match(BOOL);
				}
				break;
			case ASTERISK:
				enterOuterAlt(_localctx, 3);
				{
				setState(104);
				match(ASTERISK);
				setState(105);
				match(ID);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class DeclarationContext extends ParserRuleContext {
		public TerminalNode VAR() { return getToken(GoliteParser.VAR, 0); }
		public List<TerminalNode> ID() { return getTokens(GoliteParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(GoliteParser.ID, i);
		}
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public List<TerminalNode> COMMA() { return getTokens(GoliteParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(GoliteParser.COMMA, i);
		}
		public DeclarationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_declaration; }
	}

	public final DeclarationContext declaration() throws RecognitionException {
		DeclarationContext _localctx = new DeclarationContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_declaration);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(108);
			match(VAR);
			setState(109);
			match(ID);
			setState(114);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(110);
				match(COMMA);
				setState(111);
				match(ID);
				}
				}
				setState(116);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(117);
			type();
			setState(118);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class FunctionContext extends ParserRuleContext {
		public TerminalNode FUNC() { return getToken(GoliteParser.FUNC, 0); }
		public TerminalNode ID() { return getToken(GoliteParser.ID, 0); }
		public TerminalNode LPAREN() { return getToken(GoliteParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(GoliteParser.RPAREN, 0); }
		public TerminalNode LBRACE() { return getToken(GoliteParser.LBRACE, 0); }
		public TerminalNode RBRACE() { return getToken(GoliteParser.RBRACE, 0); }
		public List<DeclContext> decl() {
			return getRuleContexts(DeclContext.class);
		}
		public DeclContext decl(int i) {
			return getRuleContext(DeclContext.class,i);
		}
		public ReturnTypeContext returnType() {
			return getRuleContext(ReturnTypeContext.class,0);
		}
		public List<DeclarationContext> declaration() {
			return getRuleContexts(DeclarationContext.class);
		}
		public DeclarationContext declaration(int i) {
			return getRuleContext(DeclarationContext.class,i);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(GoliteParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(GoliteParser.COMMA, i);
		}
		public FunctionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_function; }
	}

	public final FunctionContext function() throws RecognitionException {
		FunctionContext _localctx = new FunctionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_function);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(120);
			match(FUNC);
			setState(121);
			match(ID);
			setState(122);
			match(LPAREN);
			setState(131);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ID) {
				{
				setState(123);
				decl();
				setState(128);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(124);
					match(COMMA);
					setState(125);
					decl();
					}
					}
					setState(130);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
			}

			setState(133);
			match(RPAREN);
			setState(135);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & 400L) != 0)) {
				{
				setState(134);
				returnType();
				}
			}

			setState(137);
			match(LBRACE);
			setState(141);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==VAR) {
				{
				{
				setState(138);
				declaration();
				}
				}
				setState(143);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(147);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 4398046738432L) != 0)) {
				{
				{
				setState(144);
				statement();
				}
				}
				setState(149);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(150);
			match(RBRACE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ReturnTypeContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public ReturnTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_returnType; }
	}

	public final ReturnTypeContext returnType() throws RecognitionException {
		ReturnTypeContext _localctx = new ReturnTypeContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_returnType);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(152);
			type();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class StatementContext extends ParserRuleContext {
		public AssignmentContext assignment() {
			return getRuleContext(AssignmentContext.class,0);
		}
		public PrintContext print() {
			return getRuleContext(PrintContext.class,0);
		}
		public ReadContext read() {
			return getRuleContext(ReadContext.class,0);
		}
		public DeleteContext delete() {
			return getRuleContext(DeleteContext.class,0);
		}
		public ConditionalContext conditional() {
			return getRuleContext(ConditionalContext.class,0);
		}
		public LoopContext loop() {
			return getRuleContext(LoopContext.class,0);
		}
		public ReturnContext return_() {
			return getRuleContext(ReturnContext.class,0);
		}
		public InvocationContext invocation() {
			return getRuleContext(InvocationContext.class,0);
		}
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_statement);
		try {
			setState(162);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(154);
				assignment();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(155);
				print();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(156);
				read();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(157);
				delete();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(158);
				conditional();
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(159);
				loop();
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(160);
				return_();
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(161);
				invocation();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class BlockContext extends ParserRuleContext {
		public TerminalNode LBRACE() { return getToken(GoliteParser.LBRACE, 0); }
		public TerminalNode RBRACE() { return getToken(GoliteParser.RBRACE, 0); }
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(164);
			match(LBRACE);
			setState(168);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 4398046738432L) != 0)) {
				{
				{
				setState(165);
				statement();
				}
				}
				setState(170);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(171);
			match(RBRACE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class DeleteContext extends ParserRuleContext {
		public TerminalNode DELETE() { return getToken(GoliteParser.DELETE, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public DeleteContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_delete; }
	}

	public final DeleteContext delete() throws RecognitionException {
		DeleteContext _localctx = new DeleteContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_delete);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(173);
			match(DELETE);
			setState(174);
			expression();
			setState(175);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ReadContext extends ParserRuleContext {
		public TerminalNode SCAN() { return getToken(GoliteParser.SCAN, 0); }
		public LValueContext lValue() {
			return getRuleContext(LValueContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public ReadContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_read; }
	}

	public final ReadContext read() throws RecognitionException {
		ReadContext _localctx = new ReadContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_read);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(177);
			match(SCAN);
			setState(178);
			lValue();
			setState(179);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class AssignmentContext extends ParserRuleContext {
		public LValueContext lValue() {
			return getRuleContext(LValueContext.class,0);
		}
		public TerminalNode EQUALS() { return getToken(GoliteParser.EQUALS, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public AssignmentContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assignment; }
	}

	public final AssignmentContext assignment() throws RecognitionException {
		AssignmentContext _localctx = new AssignmentContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_assignment);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(181);
			lValue();
			setState(182);
			match(EQUALS);
			setState(183);
			expression();
			setState(184);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PrintContext extends ParserRuleContext {
		public TerminalNode PRINTF() { return getToken(GoliteParser.PRINTF, 0); }
		public TerminalNode LPAREN() { return getToken(GoliteParser.LPAREN, 0); }
		public TerminalNode STRINGLIT() { return getToken(GoliteParser.STRINGLIT, 0); }
		public TerminalNode RPAREN() { return getToken(GoliteParser.RPAREN, 0); }
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public List<TerminalNode> COMMA() { return getTokens(GoliteParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(GoliteParser.COMMA, i);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public PrintContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_print; }
	}

	public final PrintContext print() throws RecognitionException {
		PrintContext _localctx = new PrintContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_print);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(186);
			match(PRINTF);
			setState(187);
			match(LPAREN);
			setState(188);
			match(STRINGLIT);
			setState(193);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(189);
				match(COMMA);
				setState(190);
				expression();
				}
				}
				setState(195);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(196);
			match(RPAREN);
			setState(197);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ConditionalContext extends ParserRuleContext {
		public TerminalNode IF() { return getToken(GoliteParser.IF, 0); }
		public TerminalNode LPAREN() { return getToken(GoliteParser.LPAREN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode RPAREN() { return getToken(GoliteParser.RPAREN, 0); }
		public List<BlockContext> block() {
			return getRuleContexts(BlockContext.class);
		}
		public BlockContext block(int i) {
			return getRuleContext(BlockContext.class,i);
		}
		public TerminalNode ELSE() { return getToken(GoliteParser.ELSE, 0); }
		public ConditionalContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_conditional; }
	}

	public final ConditionalContext conditional() throws RecognitionException {
		ConditionalContext _localctx = new ConditionalContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_conditional);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(199);
			match(IF);
			setState(200);
			match(LPAREN);
			setState(201);
			expression();
			setState(202);
			match(RPAREN);
			setState(203);
			block();
			setState(206);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ELSE) {
				{
				setState(204);
				match(ELSE);
				setState(205);
				block();
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class LoopContext extends ParserRuleContext {
		public TerminalNode FOR() { return getToken(GoliteParser.FOR, 0); }
		public TerminalNode LPAREN() { return getToken(GoliteParser.LPAREN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode RPAREN() { return getToken(GoliteParser.RPAREN, 0); }
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public LoopContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_loop; }
	}

	public final LoopContext loop() throws RecognitionException {
		LoopContext _localctx = new LoopContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_loop);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(208);
			match(FOR);
			setState(209);
			match(LPAREN);
			setState(210);
			expression();
			setState(211);
			match(RPAREN);
			setState(212);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ReturnContext extends ParserRuleContext {
		public TerminalNode RETURN() { return getToken(GoliteParser.RETURN, 0); }
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public ReturnContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_return; }
	}

	public final ReturnContext return_() throws RecognitionException {
		ReturnContext _localctx = new ReturnContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_return);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(214);
			match(RETURN);
			setState(216);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & 5576813707268L) != 0)) {
				{
				setState(215);
				expression();
				}
			}

			setState(218);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class InvocationContext extends ParserRuleContext {
		public TerminalNode ID() { return getToken(GoliteParser.ID, 0); }
		public TerminalNode LPAREN() { return getToken(GoliteParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(GoliteParser.RPAREN, 0); }
		public TerminalNode SEMICOLON() { return getToken(GoliteParser.SEMICOLON, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(GoliteParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(GoliteParser.COMMA, i);
		}
		public InvocationContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_invocation; }
	}

	public final InvocationContext invocation() throws RecognitionException {
		InvocationContext _localctx = new InvocationContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_invocation);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(220);
			match(ID);
			setState(221);
			match(LPAREN);
			setState(230);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & 5576813707268L) != 0)) {
				{
				setState(222);
				expression();
				setState(227);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==COMMA) {
					{
					{
					setState(223);
					match(COMMA);
					setState(224);
					expression();
					}
					}
					setState(229);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
			}

			setState(232);
			match(RPAREN);
			setState(233);
			match(SEMICOLON);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class LValueContext extends ParserRuleContext {
		public List<TerminalNode> ID() { return getTokens(GoliteParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(GoliteParser.ID, i);
		}
		public List<TerminalNode> DOT() { return getTokens(GoliteParser.DOT); }
		public TerminalNode DOT(int i) {
			return getToken(GoliteParser.DOT, i);
		}
		public LValueContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_lValue; }
	}

	public final LValueContext lValue() throws RecognitionException {
		LValueContext _localctx = new LValueContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_lValue);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(235);
			match(ID);
			setState(240);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==DOT) {
				{
				{
				setState(236);
				match(DOT);
				setState(237);
				match(ID);
				}
				}
				setState(242);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class ExpressionContext extends ParserRuleContext {
		public List<BoolTermContext> boolTerm() {
			return getRuleContexts(BoolTermContext.class);
		}
		public BoolTermContext boolTerm(int i) {
			return getRuleContext(BoolTermContext.class,i);
		}
		public List<TerminalNode> OR() { return getTokens(GoliteParser.OR); }
		public TerminalNode OR(int i) {
			return getToken(GoliteParser.OR, i);
		}
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
	}

	public final ExpressionContext expression() throws RecognitionException {
		ExpressionContext _localctx = new ExpressionContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_expression);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(243);
			boolTerm();
			setState(248);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==OR) {
				{
				{
				setState(244);
				match(OR);
				setState(245);
				boolTerm();
				}
				}
				setState(250);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class BoolTermContext extends ParserRuleContext {
		public List<EqualTermContext> equalTerm() {
			return getRuleContexts(EqualTermContext.class);
		}
		public EqualTermContext equalTerm(int i) {
			return getRuleContext(EqualTermContext.class,i);
		}
		public List<TerminalNode> AND() { return getTokens(GoliteParser.AND); }
		public TerminalNode AND(int i) {
			return getToken(GoliteParser.AND, i);
		}
		public BoolTermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_boolTerm; }
	}

	public final BoolTermContext boolTerm() throws RecognitionException {
		BoolTermContext _localctx = new BoolTermContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_boolTerm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(251);
			equalTerm();
			setState(256);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==AND) {
				{
				{
				setState(252);
				match(AND);
				setState(253);
				equalTerm();
				}
				}
				setState(258);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class EqualTermContext extends ParserRuleContext {
		public List<RelationTermContext> relationTerm() {
			return getRuleContexts(RelationTermContext.class);
		}
		public RelationTermContext relationTerm(int i) {
			return getRuleContext(RelationTermContext.class,i);
		}
		public List<EqNeqContext> eqNeq() {
			return getRuleContexts(EqNeqContext.class);
		}
		public EqNeqContext eqNeq(int i) {
			return getRuleContext(EqNeqContext.class,i);
		}
		public EqualTermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_equalTerm; }
	}

	public final EqualTermContext equalTerm() throws RecognitionException {
		EqualTermContext _localctx = new EqualTermContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_equalTerm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(259);
			relationTerm();
			setState(265);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==EQ || _la==NEQ) {
				{
				{
				setState(260);
				eqNeq();
				setState(261);
				relationTerm();
				}
				}
				setState(267);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class EqNeqContext extends ParserRuleContext {
		public TerminalNode EQ() { return getToken(GoliteParser.EQ, 0); }
		public TerminalNode NEQ() { return getToken(GoliteParser.NEQ, 0); }
		public EqNeqContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_eqNeq; }
	}

	public final EqNeqContext eqNeq() throws RecognitionException {
		EqNeqContext _localctx = new EqNeqContext(_ctx, getState());
		enterRule(_localctx, 42, RULE_eqNeq);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(268);
			_la = _input.LA(1);
			if ( !(_la==EQ || _la==NEQ) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class RelationTermContext extends ParserRuleContext {
		public List<SimpleTermContext> simpleTerm() {
			return getRuleContexts(SimpleTermContext.class);
		}
		public SimpleTermContext simpleTerm(int i) {
			return getRuleContext(SimpleTermContext.class,i);
		}
		public List<GreaterLessContext> greaterLess() {
			return getRuleContexts(GreaterLessContext.class);
		}
		public GreaterLessContext greaterLess(int i) {
			return getRuleContext(GreaterLessContext.class,i);
		}
		public RelationTermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_relationTerm; }
	}

	public final RelationTermContext relationTerm() throws RecognitionException {
		RelationTermContext _localctx = new RelationTermContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_relationTerm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(270);
			simpleTerm();
			setState(276);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & 62914560L) != 0)) {
				{
				{
				setState(271);
				greaterLess();
				setState(272);
				simpleTerm();
				}
				}
				setState(278);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class GreaterLessContext extends ParserRuleContext {
		public TerminalNode GT() { return getToken(GoliteParser.GT, 0); }
		public TerminalNode LT() { return getToken(GoliteParser.LT, 0); }
		public TerminalNode LTE() { return getToken(GoliteParser.LTE, 0); }
		public TerminalNode GTE() { return getToken(GoliteParser.GTE, 0); }
		public GreaterLessContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_greaterLess; }
	}

	public final GreaterLessContext greaterLess() throws RecognitionException {
		GreaterLessContext _localctx = new GreaterLessContext(_ctx, getState());
		enterRule(_localctx, 46, RULE_greaterLess);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(279);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & 62914560L) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class SimpleTermContext extends ParserRuleContext {
		public List<TermContext> term() {
			return getRuleContexts(TermContext.class);
		}
		public TermContext term(int i) {
			return getRuleContext(TermContext.class,i);
		}
		public List<PlusMinusContext> plusMinus() {
			return getRuleContexts(PlusMinusContext.class);
		}
		public PlusMinusContext plusMinus(int i) {
			return getRuleContext(PlusMinusContext.class,i);
		}
		public SimpleTermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_simpleTerm; }
	}

	public final SimpleTermContext simpleTerm() throws RecognitionException {
		SimpleTermContext _localctx = new SimpleTermContext(_ctx, getState());
		enterRule(_localctx, 48, RULE_simpleTerm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(281);
			term();
			setState(287);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==PLUS || _la==MINUS) {
				{
				{
				setState(282);
				plusMinus();
				setState(283);
				term();
				}
				}
				setState(289);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class PlusMinusContext extends ParserRuleContext {
		public TerminalNode PLUS() { return getToken(GoliteParser.PLUS, 0); }
		public TerminalNode MINUS() { return getToken(GoliteParser.MINUS, 0); }
		public PlusMinusContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_plusMinus; }
	}

	public final PlusMinusContext plusMinus() throws RecognitionException {
		PlusMinusContext _localctx = new PlusMinusContext(_ctx, getState());
		enterRule(_localctx, 50, RULE_plusMinus);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(290);
			_la = _input.LA(1);
			if ( !(_la==PLUS || _la==MINUS) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class TermContext extends ParserRuleContext {
		public List<UnaryTermContext> unaryTerm() {
			return getRuleContexts(UnaryTermContext.class);
		}
		public UnaryTermContext unaryTerm(int i) {
			return getRuleContext(UnaryTermContext.class,i);
		}
		public List<AsteriskFSlashContext> asteriskFSlash() {
			return getRuleContexts(AsteriskFSlashContext.class);
		}
		public AsteriskFSlashContext asteriskFSlash(int i) {
			return getRuleContext(AsteriskFSlashContext.class,i);
		}
		public TermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_term; }
	}

	public final TermContext term() throws RecognitionException {
		TermContext _localctx = new TermContext(_ctx, getState());
		enterRule(_localctx, 52, RULE_term);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(292);
			unaryTerm();
			setState(298);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==ASTERISK || _la==FSLASH) {
				{
				{
				setState(293);
				asteriskFSlash();
				setState(294);
				unaryTerm();
				}
				}
				setState(300);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class AsteriskFSlashContext extends ParserRuleContext {
		public TerminalNode ASTERISK() { return getToken(GoliteParser.ASTERISK, 0); }
		public TerminalNode FSLASH() { return getToken(GoliteParser.FSLASH, 0); }
		public AsteriskFSlashContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_asteriskFSlash; }
	}

	public final AsteriskFSlashContext asteriskFSlash() throws RecognitionException {
		AsteriskFSlashContext _localctx = new AsteriskFSlashContext(_ctx, getState());
		enterRule(_localctx, 54, RULE_asteriskFSlash);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(301);
			_la = _input.LA(1);
			if ( !(_la==ASTERISK || _la==FSLASH) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class UnaryTermContext extends ParserRuleContext {
		public TerminalNode NOT() { return getToken(GoliteParser.NOT, 0); }
		public SelectorTermContext selectorTerm() {
			return getRuleContext(SelectorTermContext.class,0);
		}
		public TerminalNode MINUS() { return getToken(GoliteParser.MINUS, 0); }
		public UnaryTermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_unaryTerm; }
	}

	public final UnaryTermContext unaryTerm() throws RecognitionException {
		UnaryTermContext _localctx = new UnaryTermContext(_ctx, getState());
		enterRule(_localctx, 56, RULE_unaryTerm);
		try {
			setState(308);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case NOT:
				enterOuterAlt(_localctx, 1);
				{
				setState(303);
				match(NOT);
				setState(304);
				selectorTerm();
				}
				break;
			case MINUS:
				enterOuterAlt(_localctx, 2);
				{
				setState(305);
				match(MINUS);
				setState(306);
				selectorTerm();
				}
				break;
			case NEW:
			case TRUE:
			case FALSE:
			case LPAREN:
			case INTLIT:
			case NIL:
			case ID:
				enterOuterAlt(_localctx, 3);
				{
				setState(307);
				selectorTerm();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class SelectorTermContext extends ParserRuleContext {
		public FactorContext factor() {
			return getRuleContext(FactorContext.class,0);
		}
		public List<TerminalNode> DOT() { return getTokens(GoliteParser.DOT); }
		public TerminalNode DOT(int i) {
			return getToken(GoliteParser.DOT, i);
		}
		public List<TerminalNode> ID() { return getTokens(GoliteParser.ID); }
		public TerminalNode ID(int i) {
			return getToken(GoliteParser.ID, i);
		}
		public SelectorTermContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_selectorTerm; }
	}

	public final SelectorTermContext selectorTerm() throws RecognitionException {
		SelectorTermContext _localctx = new SelectorTermContext(_ctx, getState());
		enterRule(_localctx, 58, RULE_selectorTerm);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(310);
			factor();
			setState(315);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==DOT) {
				{
				{
				setState(311);
				match(DOT);
				setState(312);
				match(ID);
				}
				}
				setState(317);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	@SuppressWarnings("CheckReturnValue")
	public static class FactorContext extends ParserRuleContext {
		public TerminalNode LPAREN() { return getToken(GoliteParser.LPAREN, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public TerminalNode RPAREN() { return getToken(GoliteParser.RPAREN, 0); }
		public TerminalNode ID() { return getToken(GoliteParser.ID, 0); }
		public List<TerminalNode> COMMA() { return getTokens(GoliteParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(GoliteParser.COMMA, i);
		}
		public TerminalNode INTLIT() { return getToken(GoliteParser.INTLIT, 0); }
		public TerminalNode NEW() { return getToken(GoliteParser.NEW, 0); }
		public TerminalNode TRUE() { return getToken(GoliteParser.TRUE, 0); }
		public TerminalNode FALSE() { return getToken(GoliteParser.FALSE, 0); }
		public TerminalNode NIL() { return getToken(GoliteParser.NIL, 0); }
		public FactorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_factor; }
	}

	public final FactorContext factor() throws RecognitionException {
		FactorContext _localctx = new FactorContext(_ctx, getState());
		enterRule(_localctx, 60, RULE_factor);
		int _la;
		try {
			setState(343);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LPAREN:
				enterOuterAlt(_localctx, 1);
				{
				setState(318);
				match(LPAREN);
				setState(319);
				expression();
				setState(320);
				match(RPAREN);
				}
				break;
			case ID:
				enterOuterAlt(_localctx, 2);
				{
				setState(322);
				match(ID);
				setState(335);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==LPAREN) {
					{
					setState(323);
					match(LPAREN);
					setState(332);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if ((((_la) & ~0x3f) == 0 && ((1L << _la) & 5576813707268L) != 0)) {
						{
						setState(324);
						expression();
						setState(329);
						_errHandler.sync(this);
						_la = _input.LA(1);
						while (_la==COMMA) {
							{
							{
							setState(325);
							match(COMMA);
							setState(326);
							expression();
							}
							}
							setState(331);
							_errHandler.sync(this);
							_la = _input.LA(1);
						}
						}
					}

					setState(334);
					match(RPAREN);
					}
				}

				}
				break;
			case INTLIT:
				enterOuterAlt(_localctx, 3);
				{
				setState(337);
				match(INTLIT);
				}
				break;
			case NEW:
				enterOuterAlt(_localctx, 4);
				{
				setState(338);
				match(NEW);
				setState(339);
				match(ID);
				}
				break;
			case TRUE:
				enterOuterAlt(_localctx, 5);
				{
				setState(340);
				match(TRUE);
				}
				break;
			case FALSE:
				enterOuterAlt(_localctx, 6);
				{
				setState(341);
				match(FALSE);
				}
				break;
			case NIL:
				enterOuterAlt(_localctx, 7);
				{
				setState(342);
				match(NIL);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\u0004\u0001+\u015a\u0002\u0000\u0007\u0000\u0002\u0001\u0007\u0001\u0002"+
		"\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004\u0007\u0004\u0002"+
		"\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007\u0007\u0007\u0002"+
		"\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b\u0007\u000b\u0002"+
		"\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0002\u000f\u0007\u000f"+
		"\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011\u0002\u0012\u0007\u0012"+
		"\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014\u0002\u0015\u0007\u0015"+
		"\u0002\u0016\u0007\u0016\u0002\u0017\u0007\u0017\u0002\u0018\u0007\u0018"+
		"\u0002\u0019\u0007\u0019\u0002\u001a\u0007\u001a\u0002\u001b\u0007\u001b"+
		"\u0002\u001c\u0007\u001c\u0002\u001d\u0007\u001d\u0002\u001e\u0007\u001e"+
		"\u0001\u0000\u0005\u0000@\b\u0000\n\u0000\f\u0000C\t\u0000\u0001\u0000"+
		"\u0005\u0000F\b\u0000\n\u0000\f\u0000I\t\u0000\u0001\u0000\u0005\u0000"+
		"L\b\u0000\n\u0000\f\u0000O\t\u0000\u0001\u0000\u0001\u0000\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0005\u0001\\\b\u0001\n\u0001\f\u0001_\t\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0002"+
		"\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003\u0003\u0003k\b\u0003"+
		"\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0005\u0004q\b\u0004"+
		"\n\u0004\f\u0004t\t\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0005"+
		"\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0005\u0005\u0005"+
		"\u007f\b\u0005\n\u0005\f\u0005\u0082\t\u0005\u0003\u0005\u0084\b\u0005"+
		"\u0001\u0005\u0001\u0005\u0003\u0005\u0088\b\u0005\u0001\u0005\u0001\u0005"+
		"\u0005\u0005\u008c\b\u0005\n\u0005\f\u0005\u008f\t\u0005\u0001\u0005\u0005"+
		"\u0005\u0092\b\u0005\n\u0005\f\u0005\u0095\t\u0005\u0001\u0005\u0001\u0005"+
		"\u0001\u0006\u0001\u0006\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007"+
		"\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0003\u0007\u00a3\b\u0007"+
		"\u0001\b\u0001\b\u0005\b\u00a7\b\b\n\b\f\b\u00aa\t\b\u0001\b\u0001\b\u0001"+
		"\t\u0001\t\u0001\t\u0001\t\u0001\n\u0001\n\u0001\n\u0001\n\u0001\u000b"+
		"\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001\f\u0001\f\u0001"+
		"\f\u0001\f\u0001\f\u0005\f\u00c0\b\f\n\f\f\f\u00c3\t\f\u0001\f\u0001\f"+
		"\u0001\f\u0001\r\u0001\r\u0001\r\u0001\r\u0001\r\u0001\r\u0001\r\u0003"+
		"\r\u00cf\b\r\u0001\u000e\u0001\u000e\u0001\u000e\u0001\u000e\u0001\u000e"+
		"\u0001\u000e\u0001\u000f\u0001\u000f\u0003\u000f\u00d9\b\u000f\u0001\u000f"+
		"\u0001\u000f\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010"+
		"\u0005\u0010\u00e2\b\u0010\n\u0010\f\u0010\u00e5\t\u0010\u0003\u0010\u00e7"+
		"\b\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0011\u0001\u0011\u0001"+
		"\u0011\u0005\u0011\u00ef\b\u0011\n\u0011\f\u0011\u00f2\t\u0011\u0001\u0012"+
		"\u0001\u0012\u0001\u0012\u0005\u0012\u00f7\b\u0012\n\u0012\f\u0012\u00fa"+
		"\t\u0012\u0001\u0013\u0001\u0013\u0001\u0013\u0005\u0013\u00ff\b\u0013"+
		"\n\u0013\f\u0013\u0102\t\u0013\u0001\u0014\u0001\u0014\u0001\u0014\u0001"+
		"\u0014\u0005\u0014\u0108\b\u0014\n\u0014\f\u0014\u010b\t\u0014\u0001\u0015"+
		"\u0001\u0015\u0001\u0016\u0001\u0016\u0001\u0016\u0001\u0016\u0005\u0016"+
		"\u0113\b\u0016\n\u0016\f\u0016\u0116\t\u0016\u0001\u0017\u0001\u0017\u0001"+
		"\u0018\u0001\u0018\u0001\u0018\u0001\u0018\u0005\u0018\u011e\b\u0018\n"+
		"\u0018\f\u0018\u0121\t\u0018\u0001\u0019\u0001\u0019\u0001\u001a\u0001"+
		"\u001a\u0001\u001a\u0001\u001a\u0005\u001a\u0129\b\u001a\n\u001a\f\u001a"+
		"\u012c\t\u001a\u0001\u001b\u0001\u001b\u0001\u001c\u0001\u001c\u0001\u001c"+
		"\u0001\u001c\u0001\u001c\u0003\u001c\u0135\b\u001c\u0001\u001d\u0001\u001d"+
		"\u0001\u001d\u0005\u001d\u013a\b\u001d\n\u001d\f\u001d\u013d\t\u001d\u0001"+
		"\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001"+
		"\u001e\u0001\u001e\u0001\u001e\u0005\u001e\u0148\b\u001e\n\u001e\f\u001e"+
		"\u014b\t\u001e\u0003\u001e\u014d\b\u001e\u0001\u001e\u0003\u001e\u0150"+
		"\b\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001\u001e\u0001"+
		"\u001e\u0003\u001e\u0158\b\u001e\u0001\u001e\u0000\u0000\u001f\u0000\u0002"+
		"\u0004\u0006\b\n\f\u000e\u0010\u0012\u0014\u0016\u0018\u001a\u001c\u001e"+
		" \"$&(*,.02468:<\u0000\u0004\u0001\u0000\u0014\u0015\u0001\u0000\u0016"+
		"\u0019\u0001\u0000\u0001\u0002\u0001\u0000\u0004\u0005\u0166\u0000A\u0001"+
		"\u0000\u0000\u0000\u0002R\u0001\u0000\u0000\u0000\u0004c\u0001\u0000\u0000"+
		"\u0000\u0006j\u0001\u0000\u0000\u0000\bl\u0001\u0000\u0000\u0000\nx\u0001"+
		"\u0000\u0000\u0000\f\u0098\u0001\u0000\u0000\u0000\u000e\u00a2\u0001\u0000"+
		"\u0000\u0000\u0010\u00a4\u0001\u0000\u0000\u0000\u0012\u00ad\u0001\u0000"+
		"\u0000\u0000\u0014\u00b1\u0001\u0000\u0000\u0000\u0016\u00b5\u0001\u0000"+
		"\u0000\u0000\u0018\u00ba\u0001\u0000\u0000\u0000\u001a\u00c7\u0001\u0000"+
		"\u0000\u0000\u001c\u00d0\u0001\u0000\u0000\u0000\u001e\u00d6\u0001\u0000"+
		"\u0000\u0000 \u00dc\u0001\u0000\u0000\u0000\"\u00eb\u0001\u0000\u0000"+
		"\u0000$\u00f3\u0001\u0000\u0000\u0000&\u00fb\u0001\u0000\u0000\u0000("+
		"\u0103\u0001\u0000\u0000\u0000*\u010c\u0001\u0000\u0000\u0000,\u010e\u0001"+
		"\u0000\u0000\u0000.\u0117\u0001\u0000\u0000\u00000\u0119\u0001\u0000\u0000"+
		"\u00002\u0122\u0001\u0000\u0000\u00004\u0124\u0001\u0000\u0000\u00006"+
		"\u012d\u0001\u0000\u0000\u00008\u0134\u0001\u0000\u0000\u0000:\u0136\u0001"+
		"\u0000\u0000\u0000<\u0157\u0001\u0000\u0000\u0000>@\u0003\u0002\u0001"+
		"\u0000?>\u0001\u0000\u0000\u0000@C\u0001\u0000\u0000\u0000A?\u0001\u0000"+
		"\u0000\u0000AB\u0001\u0000\u0000\u0000BG\u0001\u0000\u0000\u0000CA\u0001"+
		"\u0000\u0000\u0000DF\u0003\b\u0004\u0000ED\u0001\u0000\u0000\u0000FI\u0001"+
		"\u0000\u0000\u0000GE\u0001\u0000\u0000\u0000GH\u0001\u0000\u0000\u0000"+
		"HM\u0001\u0000\u0000\u0000IG\u0001\u0000\u0000\u0000JL\u0003\n\u0005\u0000"+
		"KJ\u0001\u0000\u0000\u0000LO\u0001\u0000\u0000\u0000MK\u0001\u0000\u0000"+
		"\u0000MN\u0001\u0000\u0000\u0000NP\u0001\u0000\u0000\u0000OM\u0001\u0000"+
		"\u0000\u0000PQ\u0005\u0000\u0000\u0001Q\u0001\u0001\u0000\u0000\u0000"+
		"RS\u0005)\u0000\u0000ST\u0005*\u0000\u0000TU\u0005\'\u0000\u0000UV\u0005"+
		"\u001f\u0000\u0000VW\u0003\u0004\u0002\u0000W]\u0005\u0006\u0000\u0000"+
		"XY\u0003\u0004\u0002\u0000YZ\u0005\u0006\u0000\u0000Z\\\u0001\u0000\u0000"+
		"\u0000[X\u0001\u0000\u0000\u0000\\_\u0001\u0000\u0000\u0000][\u0001\u0000"+
		"\u0000\u0000]^\u0001\u0000\u0000\u0000^`\u0001\u0000\u0000\u0000_]\u0001"+
		"\u0000\u0000\u0000`a\u0005 \u0000\u0000ab\u0005\u0006\u0000\u0000b\u0003"+
		"\u0001\u0000\u0000\u0000cd\u0005*\u0000\u0000de\u0003\u0006\u0003\u0000"+
		"e\u0005\u0001\u0000\u0000\u0000fk\u0005\u0007\u0000\u0000gk\u0005\b\u0000"+
		"\u0000hi\u0005\u0004\u0000\u0000ik\u0005*\u0000\u0000jf\u0001\u0000\u0000"+
		"\u0000jg\u0001\u0000\u0000\u0000jh\u0001\u0000\u0000\u0000k\u0007\u0001"+
		"\u0000\u0000\u0000lm\u0005\t\u0000\u0000mr\u0005*\u0000\u0000no\u0005"+
		"#\u0000\u0000oq\u0005*\u0000\u0000pn\u0001\u0000\u0000\u0000qt\u0001\u0000"+
		"\u0000\u0000rp\u0001\u0000\u0000\u0000rs\u0001\u0000\u0000\u0000su\u0001"+
		"\u0000\u0000\u0000tr\u0001\u0000\u0000\u0000uv\u0003\u0006\u0003\u0000"+
		"vw\u0005\u0006\u0000\u0000w\t\u0001\u0000\u0000\u0000xy\u0005\n\u0000"+
		"\u0000yz\u0005*\u0000\u0000z\u0083\u0005!\u0000\u0000{\u0080\u0003\u0004"+
		"\u0002\u0000|}\u0005#\u0000\u0000}\u007f\u0003\u0004\u0002\u0000~|\u0001"+
		"\u0000\u0000\u0000\u007f\u0082\u0001\u0000\u0000\u0000\u0080~\u0001\u0000"+
		"\u0000\u0000\u0080\u0081\u0001\u0000\u0000\u0000\u0081\u0084\u0001\u0000"+
		"\u0000\u0000\u0082\u0080\u0001\u0000\u0000\u0000\u0083{\u0001\u0000\u0000"+
		"\u0000\u0083\u0084\u0001\u0000\u0000\u0000\u0084\u0085\u0001\u0000\u0000"+
		"\u0000\u0085\u0087\u0005\"\u0000\u0000\u0086\u0088\u0003\f\u0006\u0000"+
		"\u0087\u0086\u0001\u0000\u0000\u0000\u0087\u0088\u0001\u0000\u0000\u0000"+
		"\u0088\u0089\u0001\u0000\u0000\u0000\u0089\u008d\u0005\u001f\u0000\u0000"+
		"\u008a\u008c\u0003\b\u0004\u0000\u008b\u008a\u0001\u0000\u0000\u0000\u008c"+
		"\u008f\u0001\u0000\u0000\u0000\u008d\u008b\u0001\u0000\u0000\u0000\u008d"+
		"\u008e\u0001\u0000\u0000\u0000\u008e\u0093\u0001\u0000\u0000\u0000\u008f"+
		"\u008d\u0001\u0000\u0000\u0000\u0090\u0092\u0003\u000e\u0007\u0000\u0091"+
		"\u0090\u0001\u0000\u0000\u0000\u0092\u0095\u0001\u0000\u0000\u0000\u0093"+
		"\u0091\u0001\u0000\u0000\u0000\u0093\u0094\u0001\u0000\u0000\u0000\u0094"+
		"\u0096\u0001\u0000\u0000\u0000\u0095\u0093\u0001\u0000\u0000\u0000\u0096"+
		"\u0097\u0005 \u0000\u0000\u0097\u000b\u0001\u0000\u0000\u0000\u0098\u0099"+
		"\u0003\u0006\u0003\u0000\u0099\r\u0001\u0000\u0000\u0000\u009a\u00a3\u0003"+
		"\u0016\u000b\u0000\u009b\u00a3\u0003\u0018\f\u0000\u009c\u00a3\u0003\u0014"+
		"\n\u0000\u009d\u00a3\u0003\u0012\t\u0000\u009e\u00a3\u0003\u001a\r\u0000"+
		"\u009f\u00a3\u0003\u001c\u000e\u0000\u00a0\u00a3\u0003\u001e\u000f\u0000"+
		"\u00a1\u00a3\u0003 \u0010\u0000\u00a2\u009a\u0001\u0000\u0000\u0000\u00a2"+
		"\u009b\u0001\u0000\u0000\u0000\u00a2\u009c\u0001\u0000\u0000\u0000\u00a2"+
		"\u009d\u0001\u0000\u0000\u0000\u00a2\u009e\u0001\u0000\u0000\u0000\u00a2"+
		"\u009f\u0001\u0000\u0000\u0000\u00a2\u00a0\u0001\u0000\u0000\u0000\u00a2"+
		"\u00a1\u0001\u0000\u0000\u0000\u00a3\u000f\u0001\u0000\u0000\u0000\u00a4"+
		"\u00a8\u0005\u001f\u0000\u0000\u00a5\u00a7\u0003\u000e\u0007\u0000\u00a6"+
		"\u00a5\u0001\u0000\u0000\u0000\u00a7\u00aa\u0001\u0000\u0000\u0000\u00a8"+
		"\u00a6\u0001\u0000\u0000\u0000\u00a8\u00a9\u0001\u0000\u0000\u0000\u00a9"+
		"\u00ab\u0001\u0000\u0000\u0000\u00aa\u00a8\u0001\u0000\u0000\u0000\u00ab"+
		"\u00ac\u0005 \u0000\u0000\u00ac\u0011\u0001\u0000\u0000\u0000\u00ad\u00ae"+
		"\u0005\u000b\u0000\u0000\u00ae\u00af\u0003$\u0012\u0000\u00af\u00b0\u0005"+
		"\u0006\u0000\u0000\u00b0\u0013\u0001\u0000\u0000\u0000\u00b1\u00b2\u0005"+
		"\f\u0000\u0000\u00b2\u00b3\u0003\"\u0011\u0000\u00b3\u00b4\u0005\u0006"+
		"\u0000\u0000\u00b4\u0015\u0001\u0000\u0000\u0000\u00b5\u00b6\u0003\"\u0011"+
		"\u0000\u00b6\u00b7\u0005\u0003\u0000\u0000\u00b7\u00b8\u0003$\u0012\u0000"+
		"\u00b8\u00b9\u0005\u0006\u0000\u0000\u00b9\u0017\u0001\u0000\u0000\u0000"+
		"\u00ba\u00bb\u0005\r\u0000\u0000\u00bb\u00bc\u0005!\u0000\u0000\u00bc"+
		"\u00c1\u0005%\u0000\u0000\u00bd\u00be\u0005#\u0000\u0000\u00be\u00c0\u0003"+
		"$\u0012\u0000\u00bf\u00bd\u0001\u0000\u0000\u0000\u00c0\u00c3\u0001\u0000"+
		"\u0000\u0000\u00c1\u00bf\u0001\u0000\u0000\u0000\u00c1\u00c2\u0001\u0000"+
		"\u0000\u0000\u00c2\u00c4\u0001\u0000\u0000\u0000\u00c3\u00c1\u0001\u0000"+
		"\u0000\u0000\u00c4\u00c5\u0005\"\u0000\u0000\u00c5\u00c6\u0005\u0006\u0000"+
		"\u0000\u00c6\u0019\u0001\u0000\u0000\u0000\u00c7\u00c8\u0005\u000e\u0000"+
		"\u0000\u00c8\u00c9\u0005!\u0000\u0000\u00c9\u00ca\u0003$\u0012\u0000\u00ca"+
		"\u00cb\u0005\"\u0000\u0000\u00cb\u00ce\u0003\u0010\b\u0000\u00cc\u00cd"+
		"\u0005\u000f\u0000\u0000\u00cd\u00cf\u0003\u0010\b\u0000\u00ce\u00cc\u0001"+
		"\u0000\u0000\u0000\u00ce\u00cf\u0001\u0000\u0000\u0000\u00cf\u001b\u0001"+
		"\u0000\u0000\u0000\u00d0\u00d1\u0005\u0010\u0000\u0000\u00d1\u00d2\u0005"+
		"!\u0000\u0000\u00d2\u00d3\u0003$\u0012\u0000\u00d3\u00d4\u0005\"\u0000"+
		"\u0000\u00d4\u00d5\u0003\u0010\b\u0000\u00d5\u001d\u0001\u0000\u0000\u0000"+
		"\u00d6\u00d8\u0005\u0011\u0000\u0000\u00d7\u00d9\u0003$\u0012\u0000\u00d8"+
		"\u00d7\u0001\u0000\u0000\u0000\u00d8\u00d9\u0001\u0000\u0000\u0000\u00d9"+
		"\u00da\u0001\u0000\u0000\u0000\u00da\u00db\u0005\u0006\u0000\u0000\u00db"+
		"\u001f\u0001\u0000\u0000\u0000\u00dc\u00dd\u0005*\u0000\u0000\u00dd\u00e6"+
		"\u0005!\u0000\u0000\u00de\u00e3\u0003$\u0012\u0000\u00df\u00e0\u0005#"+
		"\u0000\u0000\u00e0\u00e2\u0003$\u0012\u0000\u00e1\u00df\u0001\u0000\u0000"+
		"\u0000\u00e2\u00e5\u0001\u0000\u0000\u0000\u00e3\u00e1\u0001\u0000\u0000"+
		"\u0000\u00e3\u00e4\u0001\u0000\u0000\u0000\u00e4\u00e7\u0001\u0000\u0000"+
		"\u0000\u00e5\u00e3\u0001\u0000\u0000\u0000\u00e6\u00de\u0001\u0000\u0000"+
		"\u0000\u00e6\u00e7\u0001\u0000\u0000\u0000\u00e7\u00e8\u0001\u0000\u0000"+
		"\u0000\u00e8\u00e9\u0005\"\u0000\u0000\u00e9\u00ea\u0005\u0006\u0000\u0000"+
		"\u00ea!\u0001\u0000\u0000\u0000\u00eb\u00f0\u0005*\u0000\u0000\u00ec\u00ed"+
		"\u0005\u001b\u0000\u0000\u00ed\u00ef\u0005*\u0000\u0000\u00ee\u00ec\u0001"+
		"\u0000\u0000\u0000\u00ef\u00f2\u0001\u0000\u0000\u0000\u00f0\u00ee\u0001"+
		"\u0000\u0000\u0000\u00f0\u00f1\u0001\u0000\u0000\u0000\u00f1#\u0001\u0000"+
		"\u0000\u0000\u00f2\u00f0\u0001\u0000\u0000\u0000\u00f3\u00f8\u0003&\u0013"+
		"\u0000\u00f4\u00f5\u0005\u0012\u0000\u0000\u00f5\u00f7\u0003&\u0013\u0000"+
		"\u00f6\u00f4\u0001\u0000\u0000\u0000\u00f7\u00fa\u0001\u0000\u0000\u0000"+
		"\u00f8\u00f6\u0001\u0000\u0000\u0000\u00f8\u00f9\u0001\u0000\u0000\u0000"+
		"\u00f9%\u0001\u0000\u0000\u0000\u00fa\u00f8\u0001\u0000\u0000\u0000\u00fb"+
		"\u0100\u0003(\u0014\u0000\u00fc\u00fd\u0005\u0013\u0000\u0000\u00fd\u00ff"+
		"\u0003(\u0014\u0000\u00fe\u00fc\u0001\u0000\u0000\u0000\u00ff\u0102\u0001"+
		"\u0000\u0000\u0000\u0100\u00fe\u0001\u0000\u0000\u0000\u0100\u0101\u0001"+
		"\u0000\u0000\u0000\u0101\'\u0001\u0000\u0000\u0000\u0102\u0100\u0001\u0000"+
		"\u0000\u0000\u0103\u0109\u0003,\u0016\u0000\u0104\u0105\u0003*\u0015\u0000"+
		"\u0105\u0106\u0003,\u0016\u0000\u0106\u0108\u0001\u0000\u0000\u0000\u0107"+
		"\u0104\u0001\u0000\u0000\u0000\u0108\u010b\u0001\u0000\u0000\u0000\u0109"+
		"\u0107\u0001\u0000\u0000\u0000\u0109\u010a\u0001\u0000\u0000\u0000\u010a"+
		")\u0001\u0000\u0000\u0000\u010b\u0109\u0001\u0000\u0000\u0000\u010c\u010d"+
		"\u0007\u0000\u0000\u0000\u010d+\u0001\u0000\u0000\u0000\u010e\u0114\u0003"+
		"0\u0018\u0000\u010f\u0110\u0003.\u0017\u0000\u0110\u0111\u00030\u0018"+
		"\u0000\u0111\u0113\u0001\u0000\u0000\u0000\u0112\u010f\u0001\u0000\u0000"+
		"\u0000\u0113\u0116\u0001\u0000\u0000\u0000\u0114\u0112\u0001\u0000\u0000"+
		"\u0000\u0114\u0115\u0001\u0000\u0000\u0000\u0115-\u0001\u0000\u0000\u0000"+
		"\u0116\u0114\u0001\u0000\u0000\u0000\u0117\u0118\u0007\u0001\u0000\u0000"+
		"\u0118/\u0001\u0000\u0000\u0000\u0119\u011f\u00034\u001a\u0000\u011a\u011b"+
		"\u00032\u0019\u0000\u011b\u011c\u00034\u001a\u0000\u011c\u011e\u0001\u0000"+
		"\u0000\u0000\u011d\u011a\u0001\u0000\u0000\u0000\u011e\u0121\u0001\u0000"+
		"\u0000\u0000\u011f\u011d\u0001\u0000\u0000\u0000\u011f\u0120\u0001\u0000"+
		"\u0000\u0000\u01201\u0001\u0000\u0000\u0000\u0121\u011f\u0001\u0000\u0000"+
		"\u0000\u0122\u0123\u0007\u0002\u0000\u0000\u01233\u0001\u0000\u0000\u0000"+
		"\u0124\u012a\u00038\u001c\u0000\u0125\u0126\u00036\u001b\u0000\u0126\u0127"+
		"\u00038\u001c\u0000\u0127\u0129\u0001\u0000\u0000\u0000\u0128\u0125\u0001"+
		"\u0000\u0000\u0000\u0129\u012c\u0001\u0000\u0000\u0000\u012a\u0128\u0001"+
		"\u0000\u0000\u0000\u012a\u012b\u0001\u0000\u0000\u0000\u012b5\u0001\u0000"+
		"\u0000\u0000\u012c\u012a\u0001\u0000\u0000\u0000\u012d\u012e\u0007\u0003"+
		"\u0000\u0000\u012e7\u0001\u0000\u0000\u0000\u012f\u0130\u0005\u001a\u0000"+
		"\u0000\u0130\u0135\u0003:\u001d\u0000\u0131\u0132\u0005\u0002\u0000\u0000"+
		"\u0132\u0135\u0003:\u001d\u0000\u0133\u0135\u0003:\u001d\u0000\u0134\u012f"+
		"\u0001\u0000\u0000\u0000\u0134\u0131\u0001\u0000\u0000\u0000\u0134\u0133"+
		"\u0001\u0000\u0000\u0000\u01359\u0001\u0000\u0000\u0000\u0136\u013b\u0003"+
		"<\u001e\u0000\u0137\u0138\u0005\u001b\u0000\u0000\u0138\u013a\u0005*\u0000"+
		"\u0000\u0139\u0137\u0001\u0000\u0000\u0000\u013a\u013d\u0001\u0000\u0000"+
		"\u0000\u013b\u0139\u0001\u0000\u0000\u0000\u013b\u013c\u0001\u0000\u0000"+
		"\u0000\u013c;\u0001\u0000\u0000\u0000\u013d\u013b\u0001\u0000\u0000\u0000"+
		"\u013e\u013f\u0005!\u0000\u0000\u013f\u0140\u0003$\u0012\u0000\u0140\u0141"+
		"\u0005\"\u0000\u0000\u0141\u0158\u0001\u0000\u0000\u0000\u0142\u014f\u0005"+
		"*\u0000\u0000\u0143\u014c\u0005!\u0000\u0000\u0144\u0149\u0003$\u0012"+
		"\u0000\u0145\u0146\u0005#\u0000\u0000\u0146\u0148\u0003$\u0012\u0000\u0147"+
		"\u0145\u0001\u0000\u0000\u0000\u0148\u014b\u0001\u0000\u0000\u0000\u0149"+
		"\u0147\u0001\u0000\u0000\u0000\u0149\u014a\u0001\u0000\u0000\u0000\u014a"+
		"\u014d\u0001\u0000\u0000\u0000\u014b\u0149\u0001\u0000\u0000\u0000\u014c"+
		"\u0144\u0001\u0000\u0000\u0000\u014c\u014d\u0001\u0000\u0000\u0000\u014d"+
		"\u014e\u0001\u0000\u0000\u0000\u014e\u0150\u0005\"\u0000\u0000\u014f\u0143"+
		"\u0001\u0000\u0000\u0000\u014f\u0150\u0001\u0000\u0000\u0000\u0150\u0158"+
		"\u0001\u0000\u0000\u0000\u0151\u0158\u0005$\u0000\u0000\u0152\u0153\u0005"+
		"\u001c\u0000\u0000\u0153\u0158\u0005*\u0000\u0000\u0154\u0158\u0005\u001d"+
		"\u0000\u0000\u0155\u0158\u0005\u001e\u0000\u0000\u0156\u0158\u0005(\u0000"+
		"\u0000\u0157\u013e\u0001\u0000\u0000\u0000\u0157\u0142\u0001\u0000\u0000"+
		"\u0000\u0157\u0151\u0001\u0000\u0000\u0000\u0157\u0152\u0001\u0000\u0000"+
		"\u0000\u0157\u0154\u0001\u0000\u0000\u0000\u0157\u0155\u0001\u0000\u0000"+
		"\u0000\u0157\u0156\u0001\u0000\u0000\u0000\u0158=\u0001\u0000\u0000\u0000"+
		"\u001fAGM]jr\u0080\u0083\u0087\u008d\u0093\u00a2\u00a8\u00c1\u00ce\u00d8"+
		"\u00e3\u00e6\u00f0\u00f8\u0100\u0109\u0114\u011f\u012a\u0134\u013b\u0149"+
		"\u014c\u014f\u0157";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}