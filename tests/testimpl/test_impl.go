package common

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/nexient-llc/lcaf-component-terratest-common/types"
	"github.com/stretchr/testify/assert"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	t.Run("TestSkeletonDeployedIsInvokable", func(t *testing.T) {
		output := terraform.Output(t, ctx.TerratestTerraformOptions, "role_assignment_id")

		assert.NotEmpty(t, output, "ID cannot be empty")
	})
}
