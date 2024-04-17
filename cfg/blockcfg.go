package cfg

import (
	"bytes"
)

type BlockType int

const (
	NORMAL BlockType = iota
	IFTRUE
	IFFALSE
	FORENTRY
	FORBODY
	FOREXIT
)

type Block struct {
	Label           string
	Instrs          []Instruction
	Preds           []*Block
	Succs           []*Block
	Ty              BlockType
	ToForEntry      *Block
	ToForBody       *Block
	ToForExit       *Block
	AllBlocksInLoop []*Block
}

func (b *Block) AddInstr(instr Instruction) {
	b.Instrs = append(b.Instrs, instr)
}

func (b *Block) AddInstructions(instrs []Instruction) {
	b.Instrs = append(b.Instrs, instrs...)
}

func (b *Block) AddPred(pred *Block) {
	b.Preds = append(b.Preds, pred)
}

func (b *Block) AddSucc(succ *Block) {
	b.Succs = append(b.Succs, succ)
}

func NewBlock(labelGen func() string) *Block {
	entry := &Block{labelGen(), []Instruction{}, []*Block{}, []*Block{}, NORMAL, nil, nil, nil, []*Block{}}
	return entry
}

func NewIfBlock(entry *Block, labelGen func() string, toForExit *Block) (trueBlk, falseBlk, exit *Block) {
	trueBlk = &Block{labelGen(), []Instruction{}, []*Block{entry}, []*Block{}, IFTRUE, nil, nil, toForExit, []*Block{}}
	falseBlk = &Block{labelGen(), []Instruction{}, []*Block{entry}, []*Block{}, IFFALSE, nil, nil, toForExit, []*Block{}}
	exit = &Block{labelGen(), []Instruction{}, []*Block{trueBlk, falseBlk}, []*Block{}, NORMAL, nil, nil, toForExit, []*Block{}}
	trueBlk.Succs = append(trueBlk.Succs, exit)
	falseBlk.Succs = append(falseBlk.Succs, exit)
	entry.Succs = append(append(entry.Succs, trueBlk), falseBlk)
	return trueBlk, falseBlk, exit
}

func NewForBlock(prev *Block, labelGen func() string) (entry, body, exit *Block) {
	entry = &Block{labelGen(), []Instruction{}, []*Block{}, []*Block{}, FORENTRY, nil, nil, nil, []*Block{}}
	body = &Block{labelGen(), []Instruction{}, []*Block{entry}, []*Block{entry}, FORBODY, entry, nil, nil, []*Block{}}
	exit = &Block{labelGen(), []Instruction{}, []*Block{entry}, []*Block{}, FOREXIT, entry, body, nil, []*Block{}}
	entry.ToForExit = exit
	entry.ToForBody = body
	body.ToForExit = exit
	entry.Succs = append(append(entry.Succs, body), exit)
	prev.Succs = append(prev.Succs, entry)
	return entry, body, exit
}

func (b *Block) String() string {
	var out bytes.Buffer
	out.WriteString(b.Label)
	out.WriteString(":\n")
	for _, instr := range b.Instrs {
		out.WriteString("\t")
		out.WriteString(instr.String())
		out.WriteString("\n")
	}
	return out.String()
}

func (b *Block) InOrderBlocks() []*Block {
	var out = []*Block{}
	var queue = []*Block{b}
	allSeen := queue
	var curr *Block
	var unseen bool
	for {
		curr = queue[0]
		out = append(out, curr)
		for _, block := range curr.Succs {
			unseen = true
			for _, seenBlk := range allSeen {
				if seenBlk == block {
					unseen = false
					break
				}
			}
			if unseen {
				queue = append(queue, block)
				allSeen = append(allSeen, block)
			}
		}
		if len(queue) == 1 {
			break
		} else {
			queue = queue[1:]
		}
	}
	return out
}
